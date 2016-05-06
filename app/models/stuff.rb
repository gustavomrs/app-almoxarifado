class Stuff < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :entries
  has_many :departures

  before_destroy :check_entry_and_departure

  def check_entry_and_departure
    return true if entries.count == 0 and departures.count == 0
    errors.add(:base, "Não é possível remover materias com entradas ou saídas.")
    false
  end  
end
