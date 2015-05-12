class Doctor
  attr_reader(:specialty, :name)

  define_method(:initialize) do |attributes|
    @specialty = attributes.fetch(:specialty)
    @name = attributes.fetch(:name)
  end
end
