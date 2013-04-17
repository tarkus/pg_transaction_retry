require 'fileutils'

module TransactionRetry
  module Test
    module Db

      def self.connect_to_postgresql
        ::ActiveRecord::Base.establish_connection(
          :adapter => "postgresql",
          :database => "transaction_retry_test",
          :user => 'qertoip',
          :password => 'test123'
        )
      end
      
    end
  end
end
