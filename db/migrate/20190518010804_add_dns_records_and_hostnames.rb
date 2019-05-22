class AddDnsRecordsAndHostnames < ActiveRecord::Migration[5.2]
  def change
    create_table :dns_records_hostnames do |t|
      t.references :dns_record, :hostname
    end
  end
end
