# frozen_string_literal: true

module Api::V1
  class DnsRecordsController < ApplicationController

    # GET /dns_records
    def index
      @dns_records = DnsRecord.all
      @dns_records = DnsRecord.filter_hostnames(params[:include_hostnames]) if params[:include_hostnames].present?

      if params[:exclude_hostnames].present?
        @dns_records_to_exclude = DnsRecord.filter_hostnames(params[:exclude_hostnames])
        @dns_records -= @dns_records_to_exclude
      end
    end

    # POST /dns_records
    def create
      @dns_record = DnsRecord.new(ip: dns_record_params[:ip])
      @dns_record.hostnames << find_or_create_hostnames(dns_record_params[:hostnames])

      if @dns_record.save
        render :create, status: :created
      else
        render json: @dns_record.errors, status: :unprocessable_entity
      end
    end

    private

    def find_or_create_hostnames(domains)
      domains.map { |domain| Hostname.find_or_create_by(domain: domain) }
    end

    def dns_record_params
      params.require(:dns_record).permit(:ip, hostnames: [])
    end
  end
end
