require'pg'


DB = PG.connect({:dbname => 'hospital'})

class Doctor
  attr_accessor(:name, :specialty_id)
  attr_reader(:id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty_id = attributes.fetch(:specialty_id)
    @id = attributes.fetch(:id).to_i
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors_tb;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty_id = doctor.fetch("specialty_id")
      id = doctor.fetch("id").to_i()
      doctors.push(Doctor.new({:name => name, :specialty_id => specialty_id, :id => id}))
    end
    doctors
  end

  def self.find(id)
    returned_doctors = DB.exec("SELECT * FROM doctors_tb WHERE id = #{id};")
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty_id = doctor.fetch("specialty_id")
      id = doctor.fetch("id").to_i()
      return Doctor.new({:name => name, :specialty_id => specialty_id, :id => id})
    end
  end

  def save
    result = DB.exec("INSERT INTO doctors_tb(name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_doctor)
    self.name().==(another_doctor.name()).&(self.id().==(another_doctor.id()))
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
