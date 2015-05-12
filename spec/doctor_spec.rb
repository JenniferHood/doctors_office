require('spec_helper')

describe(Doctor) do
  describe(':specialty') do
    it('user enters the doctors specialty') do
      test_doctor = Doctor.new(:specialty => "neurologist", :name => "Todd")
      expect(test_doctor.specialty()).to(eq("neurologist"))
    end
  end

  describe(':save') do
    it('saves doctors name in the database') do
      test_doctor = Doctor.new(:name => "James", :specialty => nil)
      test_doctor.save()
      expect(Doctor.all()).to(eq([test_doctor]))
    end
  end

  describe('.all') do
    it('program will return all of the doctors names, in this case it will be empty') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same doctor if they have the same name and list ID") do
      doctor1 = Doctor.new({:name => "Andrew", :specialty => nil})
      doctor2 = Doctor.new({:name => "Andrew", :specialty => nil})
      expect(doctor1).to(eq(doctor2))
    end
  end

end
