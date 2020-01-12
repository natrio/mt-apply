class Commune < ApplicationRecord
  belongs_to :intercommunality, optional: true
  has_many :streets

  validates :name, presence: true, case_sensitive: false
  validates :code_insee, length: {is: 5}, presence: true

  def self.search(pattern)
    pattern = pattern.downcase.gsub(/[^a-zA-Z\u00C0-\u00FF]/) { |s| '\\' + s }
    pattern.blank? ? all : where('name LIKE ?', "%#{pattern}%")
  end

  def self.to_hash
    self.all.to_h { |commune| [commune.code_insee, commune.name] } unless self.all.empty?
  end

end
