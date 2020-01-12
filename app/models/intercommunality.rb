class Intercommunality < ApplicationRecord
  has_many :communes, -> { order "name asc" }

  validates :name, :siren, presence: true
  validates :form, inclusion: {in: %w(ca cu cc met), message: "%{value} is not valid"}
  validates :siren, uniqueness: {case_sensitive: true}

  validate :is_siren_number

  attr_accessor :slug

  def is_siren_number
    # Validates siren format according to
    # http://fr.wikipedia.org/wiki/SIREN
    if siren.present? and siren.to_s.length == 9
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

  def communes_hash
    self.communes.to_h { |commune| [commune.code_insee, commune.name] } unless self.communes.empty?
  end

  def update_slug(name)
    @slug = name.parameterize unless name.nil?
  end

  def slug
    @slug.nil? ? update_slug(self.name) : @slug
  end

  def update(attributes)
    (attributes.key? :slug) ? update_slug(attributes.fetch :name) : update_slug(self.name)
    super attributes
  end

  def population
    self.communes.sum(:population)
  end

end
