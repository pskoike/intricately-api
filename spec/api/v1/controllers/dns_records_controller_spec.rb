# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DnsRecordsController, type: :controller do
  render_views

  describe 'GET #index' do
    before do
      get :index, format: :json
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON body response contains expected attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(%w[total_dns_records matching_records hostnames])
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { dns_record: { ip: '10.0.0.66', hostnames: ['qaz.com', 'poi.com'] } } }

    before do
      post :create, format: :json, params: valid_attributes
    end

    it 'returns http success' do
      expect(response).to have_http_status(:created)
    end

    it 'JSON body response contains expected attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(%w[dns_record_id])
    end

    it 'creates a new dns_record' do
      expect(DnsRecord.last.ip).to eq('10.0.0.66')
    end
  end
end
