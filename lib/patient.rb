class Patient
  attr_reader(:name, :birthdate)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    # @doctor = attributes.fetch(:doctor)
  end
end
