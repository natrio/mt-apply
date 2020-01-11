class Intercommunality < ApplicationRecord
  has_many :communes

  validates :name, :siren, presence: true
  validates :form, inclusion: {in: %w(ca cu cc met), message: "%{value} is not valid"}
  validates :siren, uniqueness: {case_sensitive: true}

  validate :is_siren_number

  def is_siren_number
    # Validates siren format according to
    # http://fr.wikipedia.org/wiki/SIREN
    if siren.present? and siren.to_s.length == 9
      puts siren
      str = siren.to_s
      reversed_array = str.split('').reverse

      digits = reversed_array.each_with_index.map do |char, i|
        coeff = (i % 2) + 1
        (char.to_i * coeff).to_s.split('')
      end

      sum = digits.flatten.map(&:to_i).inject(:+)

      record.errors.add attribute, :format unless (sum % 10) == 0
    else
      errors.add :siren, :length
    end
  end

end
