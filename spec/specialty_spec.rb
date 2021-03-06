require('spec_helper')

describe(Specialty) do

  describe(".all") do
    it("starts off with no specialties for doctors on list") do
      expect(Specialty.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("tells you the doctor's specialty") do
      specialty = Specialty.new({:specialty_name => 'higher thought', :id => nil})
      specialty.save
      expect(specialty.specialty_name()).to(eq("higher thought"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      specialty = Specialty.new({:specialty_name => 'higher thought', :id => nil})
      specialty.save()
      expect(specialty.id()).to(be_an_instance_of(Integer))
    end
  end

  describe("#save") do
    it("lets you save special-tys to the database") do
      specialty = Specialty.new({:specialty_name => 'higher thought', :id => nil})
      specialty.save()
      expect(Specialty.all()).to(eq([specialty]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      specialty1 = Specialty.new({:specialty_name => 'higher thought', :id => nil})
      specialty2 = Specialty.new({:specialty_name => 'higher thought', :id => nil})
      specialty1.save
      specialty2.save
      expect(specialty1).to(eq(specialty2))
    end
  end
end
