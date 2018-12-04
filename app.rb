require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload('./lib/**/*.rb')
require './lib/doctor.rb'

get ('/') do
  @doctors = Doctor.all
  erb(:input)
end

post('/add_doctor') do
  doctor = Doctor.new(params)
  doctor.save
  @first_name = doctor.first_name
  @last_name = doctor.last_name
  @specialty_id = doctor.specialty_id
  @doctors = Doctor.all
  binding.pry
  erb(:input)
end

post('/add_patient') do
  first_name = params["first_name"]
  last_name = params["last_name"]
  doctor_id = params["doctor_id"]
  patient = Patient.new({:first_name => first_name, :last_name => last_name, :doctor_id => doctor_id, :id => nil})
  patient.save
  @first_name = patient.first_name
  @last_name = patient.last_name
  @doctor_id = patient.doctor_id
  @patient = Patient.all
  binding.pry
  erb(:input)
end

get('/details/:id') do
  @doctor = Doctor.find(params[:id])
  erb(:output)
end

d
