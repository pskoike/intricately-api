class CreateDnsRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :dns_records do |t|
      t.string :ip

      t.timestamps
    end
  end
end
