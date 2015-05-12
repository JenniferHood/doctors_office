class Patient
  attr_reader(:name, :birthdate, :id, :doctor_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @doctor = nil
    @id = nil
  end

  define_method(:save) do
    patient = DB.exec("INSERT INTO patients (name) VALUES ('#{@name}') RETURNING id;")
    @id = patient.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    patients = DB.exec("SELECT * FROM patients;")
    returned_patients = []
    patients.each() do |patient|
      name = patient.fetch("name")
      birthdate = patient.fetch("birthdate")
      returned_patients.push(Patient.new({:name => name, :birthdate => birthdate}))
    end
    returned_patients
  end

  define_method(:==) do |another_patient|
    patient = self.birthdate().eql?(another_patient.birthdate())
    patient_name = self.name().eql?(another_patient.name())
    patient.&(patient_name)
  end
end
