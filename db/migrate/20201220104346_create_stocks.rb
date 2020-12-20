class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.decimal :last_price

      t.timestamps
    end
  end
end

client = IEX::Api::Client.new(publishable_token: 'pk_793a06f9973541a0814ab9cbcc6702b5', secret_token: 'sk_e5493d46ba0245d2a25aa73d1e4cf99e', endpoint: 'https://cloud.iexapis.com/v1')
