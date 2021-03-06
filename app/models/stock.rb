class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token],
      secret_token: Rails.application.credentials.iex_client[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      company = client.company(ticker_symbol)
      quote = client.quote(ticker_symbol)
      new(ticker: ticker_symbol, name: company.company_name, last_price: quote.latest_price)
    rescue => exception
      return nil
    end
  end
end
