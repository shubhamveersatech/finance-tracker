class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: "Tpk_d321f4a5df674410a306a28988a05787" ,
            secret_token: 'Tsk_036c3b9633c542988502dea5f9e31a22',
            endpoint: 'https://sandbox.iexapis.com/v1'
          )
          begin
            s= new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol) )
          rescue => exception
              return nil
          end
          
          return s
    end


end
