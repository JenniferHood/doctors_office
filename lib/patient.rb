class Patient
  attr_reader(:name, :birthdate, :id, :doctor_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @doctor_id = nil
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

  define_method(:assign_doctor) do |scrubs|
    medic = scrubs.name
    returned_results = DB.exec("SELECT id FROM doctors WHERE name = ('#{medic}');")
    medic_ids = []
    returned_results.each() do |id|
      whatever = id.fetch("id")
      medic_ids.push(whatever)
    end
    @doctor_id = medic_ids.first.to_i #grabs the first value in medic_id array and makes it an interger for @doctor_id
    DB.exec("UPDATE patients SET doctor_id = ('#{@doctor_id}') WHERE name = ('#{self.name}');")
  end
end
