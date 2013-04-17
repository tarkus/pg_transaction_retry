# Prepares application to be tested (requires files, connects to db, resets schema and data, applies patches, etc.)

# Initialize database
require 'db/all'

case ENV['db']
  when 'postgresql'
    TransactionRetry::Test::Db.connect_to_postgresql
  else
    TransactionRetry::Test::Db.connect_to_postgresql
end

require 'logger'
ActiveRecord::Base.logger = Logger.new( File.expand_path( "#{File.dirname( __FILE__ )}/log/test.log" ) )

TransactionRetry::Test::Migrations.run!

# Load the code that will be tested
require 'transaction_retry'

TransactionRetry.apply_activerecord_patch
