require('spec_helper')

describe(Patient) do

  describe(".all") do
    it("starts off with no patients on list") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("tells you the patient's name") do
      patient = Patient.new({:first_name => "Steve", :last_name => "The Dweeb", :doctor_id => 1, :id => nil})
      patient.save
      expect(patient.last_name()).to(eq("The Dweeb"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      patient = Patient.new({:first_name => "Steve", :last_name => "The Dweeb", :doctor_id => 1, :id => nil})
      patient.save()
      expect(patient.id()).to(be_an_instance_of(Integer))
    end
  end

  describe("#save") do
    it("lets you save patients to the database") do
      patient = Patient.new({:first_name => "Steve", :last_name => "The Dweeb", :doctor_id => 1, :id => nil})
      patient.save()
      expect(Patient.all()).to(eq([patient]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      patient1 = Patient.new({:first_name => "Steve", :last_name => "The Dweeb", :doctor_id => 1, :id => nil})
      patient2 = Patient.new({:first_name => "Steve", :last_name => "The Dweeb", :doctor_id => 1, :id => nil})
      patient1.save
      patient2.save
      expect(patient1).to(eq(patient2))
    end
  end
end
