# frozen_string_literal: true

class DnsRecord < ApplicationRecord
  has_and_belongs_to_many :hostnames
  validates :ip, uniqueness: true, presence: true

  scope :filter_hostnames, lambda { |hostnames|
    joins(:hostnames)
      .where(hostnames: { domain: hostnames })
      .distinct
  }
end
