class Doctor
  attr_reader(:specialty, :name, :id)

  define_method(:initialize) do |attributes|
    @specialty = attributes.fetch(:specialty)
    @name = attributes.fetch(:name)
    @id =  nil
  end

  define_method(:save) do
    doctor = DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}') RETURNING id;")
    @id = doctor.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    doctors = DB.exec("SELECT * FROM doctors;")
    returned_doctors = []
    doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      returned_doctors.push(Doctor.new({:name => name, :specialty => specialty}))
    end
    returned_doctors
  end

  define_method(:==) do |another_doctor|
    doctor = self.specialty().eql?(another_doctor.specialty())
    doctor_name = self.name().eql?(another_doctor.name())
    doctor.&(doctor_name)
  end
end
