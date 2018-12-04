require('spec_helper')

describe(Doctor) do

  describe(".all") do
    it("starts off with no doctors on list") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the doctor's name") do
      doctor = Doctor.new({:name => "Dr. Fluffles", :specialty => "Higher Thought", :id => nil})
      expect(doctor.name()).to(eq("Dr. Fluffles"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      doctor = Doctor.new({:name => "Dr. Fluffles", :specialty => "Higher Thought", :id => nil})
      doctor.save()
      expect(doctor.id()).to(be_an_instance_of(Integer))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      doctor = Doctor.new({:name => "Dr. Fluffles", :specialty => "Higher Thought", :id => nil})
      doctor.save()
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      doctor1 = Doctor.new({:name => "Dr. Fluffles", :specialty => "Higher Thought", :id => nil})
      doctor2 = Doctor.new({:name => "Dr. Fluffles", :specialty => "Higher Thought", :id => nil})
      expect(doctor1).to(eq(doctor2))
    end
  end
end
