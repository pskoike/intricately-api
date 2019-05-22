# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DnsRecord, type: :model do
  it { should validate_presence_of(:ip) }
  it { should have_and_belong_to_many(:hostnames) }
end
