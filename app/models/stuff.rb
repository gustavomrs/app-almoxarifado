class Stuff < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  has_many :entries
  has_many :departures

  before_destroy :check_entry_and_departure

  scope :ordered, -> { order :name }

  def check_entry_and_departure
    return true if (entries.count == 0 and departures.count == 0)
    errors.add(:base, "Não é possível remover materiais com entradas/saídas cadastradas.")
    false
  end

  def can_be_removed?
    return true if (departures.count == 0 and entries.count == 0)
    return false
  end
end
