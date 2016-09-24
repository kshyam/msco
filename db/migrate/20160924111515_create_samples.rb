class CreateSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :samples do |t|
      t.string :barcode
      t.string :http_referrer
      t.string :http_user_agent
      t.string :request_uri
      t.integer :status
      t.timestamps null: false
    end
  end
end