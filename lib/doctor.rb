require'pg'


DB = PG.connect({:dbname => 'doctors_db_test'})

class Doctor
  attr_accessor(:name, :specialty)
  attr_reader(:id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors_tb;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      id = doctor.fetch("id").to_i()
      doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
    end
    doctors
  end

  def self.find(id)
    returned_doctors = DB.exec("SELECT * FROM doctors_tb WHERE id = #{id};")
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      id = doctor.fetch("id").to_i()
      return Doctor.new({:name => name, :specialty => specialty, :id => id})
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
