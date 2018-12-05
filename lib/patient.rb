require'pg'


DB = PG.connect({:dbname => 'hospital'})

class Patient
  attr_accessor(:first_name, :last_name, :doctor_id, :birthday)
  attr_reader(:id)

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @doctor_id = attributes.fetch(:doctor_id)
    @birthday= attributes.fetch(:birthday)
    @id = attributes.fetch(:id).to_i
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients_tb;")
    patients = []
    returned_patients.each() do |patient|
      first_name = patient.fetch("first_name")
      last_name = patient.fetch("last_name")
      birthday = patient.fetch("birthday")
      doctor_id = patient.fetch("doctor_id").to_i
      id = patient.fetch("id").to_i()
      patients.push(Patient.new({:first_name => first_name, :last_name => last_name, :birthday => birthday, :doctor_id => doctor_id, :id => id}))
    end
    patients
  end

  def self.find(id)
    returned_patients = DB.exec("SELECT * FROM patients_tb WHERE id = #{id};")
    returned_patients.each() do |patient|
      first_name = patient.fetch("first_name")
      last_name = patient.fetch("last_name")
      birthday = patient.fetch("birthday")
      doctor_id = patient.fetch("doctor_id").to_i
      id = patient.fetch("id").to_i()
      return Patient.new({:first_name => first_name, :last_name => last_name, :birthday => birthday, :doctor_id => doctor_id, :id => id})
    end
  end

  def save
    result = DB.exec("INSERT INTO patients_tb(first_name, last_name, birthday, doctor_id) VALUES ('#{@first_name}','#{@last_name}', '#{@birthday}', #{doctor_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_patient)
    self.first_name().==(another_patient.first_name()).&(self.last_name().==(another_patient.last_name())).&(self.doctor_id().==(another_patient.doctor_id()))
  end

  def Delete(id)
    DB.exec("DELETE FROM patients_tb WHERE id = #{doctor.id};")
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

# <!-- <ul>
#   <% @patient.each() do |patient| %>
#   <li><a href="/input/<%= patient.id %>">Dr. <%= patient.first_name %> <%= patient.last_name %></a></li>
#   <% end %>
# </ul> -->
