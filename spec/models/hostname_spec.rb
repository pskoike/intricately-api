# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hostname, type: :model do
  it { should have_and_belong_to_many(:dns_records) }
end
