require'pg'


DB = PG.connect({:dbname => 'specialty_test'})

class Specialty
  attr_accessor(:specialty_name)
  attr_reader(:id)

  def initialize(attributes)
    @specialty_name = attributes.fetch(:specialty_name)
    @id = attributes.fetch(:id).to_i
  end

  def self.all
    result = DB.exec("SELECT * FROM specialties_tb;")
    specialties = []
    result.each() do |specialty|
      specialty_name = specialty.fetch("specialty_name")
      id = specialty.fetch("id").to_i()
      specialties.push(Specialty.new({:specialty_name => specialty_name, :id => id}))
    end
    specialties
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM specialties_tb WHERE id = #{id};")
    result.each() do |specialty|
      specialty_name = specialty.fetch("specialty_name")
      id = specialty.fetch("id").to_i()
      return Specialty.new({:specialty_name => specialty_name, :id => id}))
    end
  end

  def save
    result = DB.exec("INSERT INTO specialties_tb (specialty_name) VALUES ('#{@specialty_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_specialty)
    self.name().==(another_specialty.name()).&(self.id().==(another_specialty.id()))
  end
end
