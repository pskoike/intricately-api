# frozen_string_literal: true
json.total_dns_records @dns_records.count

json.matching_records(@dns_records, :id, :ip)

host_names = @dns_records.map(&:hostnames)
  .flatten.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }
  .map {|k,v| {domain: k.domain, matching_dns_records: v }}

json.hostnames(host_names, :domain, :matching_dns_records)
