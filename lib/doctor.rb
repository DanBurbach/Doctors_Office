require'pg'


DB = PG.connect({:dbname => 'hospital'})

class Doctor
  attr_accessor(:first_name, :last_name, :specialty_id)
  attr_reader(:id)

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @specialty_id = attributes.fetch(:specialty_id)
    @id = attributes.fetch(:id).to_i
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors_tb;")
    doctors = []
    returned_doctors.each() do |doctor|
      first_name = doctor.fetch("first_name")
      last_name = doctor.fetch("last_name")
      specialty_id = doctor.fetch("specialty_id").to_i
      id = doctor.fetch("id").to_i()
      doctors.push(Doctor.new({:first_name => first_name, :last_name => last_name, :specialty_id => specialty_id, :id => id}))
    end
    doctors
  end

  def self.find(id)
    returned_doctors = DB.exec("SELECT * FROM doctors_tb WHERE id = #{id};")
    returned_doctors.each() do |doctor|
      first_name = doctor.fetch("first_name")
      last_name = doctor.fetch("last_name")
      specialty_id = doctor.fetch("specialty_id").to_i
      id = doctor.fetch("id").to_i()
      return Doctor.new({:first_name => first_name, :last_name => last_name, :specialty_id => specialty_id, :id => id})
    end
  end

  def save
    result = DB.exec("INSERT INTO doctors_tb(first_name, last_name, specialty_id) VALUES ('#{@first_name}','#{@last_name}', #{specialty_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_doctor)
    self.first_name().==(another_doctor.first_name()).&(self.last_name().==(another_doctor.last_name())).&(self.specialty_id().==(another_doctor.specialty_id()))
  end
end

# <ul>
#   <% if @example.kind_of?(Array) %>
#     <% @example.each do |each| %>
#       <p id='<%= each.id %>'><a href='/output/<%= each.id %>'><%= each.name %></a></p>
#     <% end %>
#   <% else %>
#     <p id='<%= @example.id %>'><a href='/output/<%= @example.id %>'><%= @example.name %></a></p>
#   <% end %>
# </ul>
