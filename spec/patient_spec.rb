require('rspec')
require('patient')

describe(Patient) do
  describe('#name') do
    it('user enters the name of the patient and program returns name') do
      test_patient = Patient.new(:name => "Jocelyn", :birthdate => nil)
      expect(test_patient.name()).to(eq("Jocelyn"))
    end
  end
end
