class CreateSendGridEmailRecordTable < ActiveRecord::Migration
  def self.up
    create_table :sendgrid_email_records do |t|
      t.string :status
      t.string :to
      t.string :from
      t.string :subject

      t.timestamps
    end
  end

  def self.down
    drop_table :sendgrid_email_records
  end
end
