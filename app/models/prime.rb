class Prime
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :first, :last
  
  validates :first, presence: true,
    :numericality => { :only_integer => true }
  validates :last, presence: true,
    :numericality => { :only_integer => true }
  
  def initialize(attributes = {})
    @prime_generator = PrimeNumberGenerator.new
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end

  def generate
    @prime_generator.generate(first.to_i, last.to_i)
  end
end