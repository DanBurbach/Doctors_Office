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
  new_doctor = Doctor.new({:name => name, :specialty =>, :id => nil})
  new_doctor.save
  @name = doctor.name
  @specialty = doctor.specialty
  @doctors = Doctor.all
  erb(:input)
end

get('/details/:id') do
  @doctor = Doctor.find(params[:id])
  erb(:output)
end
