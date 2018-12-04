require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload('./lib/**/*.rb')
require './lib/doctor.rb'

get ('/') do
  @doctor = Doctor.all
  erb(:input)
end

post('/add_doctor') do
  name = params["name"]
  specialty = params["specialty"]
  doctor = Doctor.new({:name => name, :specialty => specialty, :id => nil})
  doctor.save
  @name = doctor.name
  @specialty = doctor.specialty
  @doctors = Doctor.all
  binding.pry
  erb(:input)
end

get('/details/:id') do
  @doctor = Doctor.find(params[:id])
  erb(:output)
end
