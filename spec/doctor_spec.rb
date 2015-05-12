require('spec_helper')

describe(Doctor) do
  describe(':specialty') do
    it('user enters the doctors specialty') do
      test_doctor = Doctor.new(:specialty => "neurologist", :name => "Todd")
      expect(test_doctor.specialty()).to(eq("neurologist"))
    end
  end
end
