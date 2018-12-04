require 'rspec'
require 'pg'
require 'doctor'

DB = PG.connect({:dbname => 'hospital'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors_tb *;")
    # DB.exec("DELETE FROM *;")
  end
end
