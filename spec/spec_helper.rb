require 'rspec'
require 'pg'
require 'doctor'
require 'patient'
require 'specialty'

DB = PG.connect({:dbname => 'hospital_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors_tb *;")
    DB.exec("DELETE FROM patients_tb *;")
    DB.exec("DELETE FROM specialty_tb *;")
  end
end
