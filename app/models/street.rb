class Street < ApplicationRecord
  has_many :communes

  attr_accessor :from, :to
  validates :title, presence: true
  validates :from, numericality: {only_integer: true, allow_nil: true}
  validates :to, numericality: {only_integer: true, allow_nil: true, greater_than: :from}
end
