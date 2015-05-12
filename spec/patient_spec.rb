require('spec_helper')

describe(Patient) do
  describe('#name') do
    it('user enters the name of the patient and program returns name') do
      test_patient = Patient.new(:name => "Jocelyn", :birthdate => nil)
      expect(test_patient.name()).to(eq("Jocelyn"))
    end
  end

  describe(':save') do
    it('saves patients name in the database') do
      test_patient = Patient.new(:name => "James", :birthdate => nil)
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe('.all') do
    it('program will return all of the patients names, in this case it will be empty') do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same patient if they have the same name and list ID") do
      patient1 = Patient.new({:name => "Andrew", :birthdate => nil})
      patient2 = Patient.new({:name => "Andrew", :birthdate => nil})
      expect(patient1).to(eq(patient2))
    end
  end

  describe('assign_doctor') do
    it('user assigns a doctor to a patient') do
      test_patient = Patient.new({:name => "Warren", :birthdate => nil})
      test_patient.save()
      test_doctor = Doctor.new({:name => "Bill", :specialty => "neurology"})
      test_doctor.save()
      test_patient.assign_doctor(test_doctor)
        expect(test_patient.doctor_id()).to(eq(test_doctor.id))
     end
   end
end
