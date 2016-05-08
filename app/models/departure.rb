class Departure < ActiveRecord::Base
  audited

  belongs_to :stuff

  validates :stuff_id, :amount, presence: true
  validate :amount_enough_to_departure?
  validates :created_at, horary: true # => custom validator at validator/horary_validator.rb

  after_save :update_stuff_amount

  scope :ordered, -> { order created_at: :desc }

  def update_stuff_amount
    stuff.update(amount: (stuff.amount - amount))
  end

  def amount_enough_to_departure?
    return unless stuff
    if (stuff.amount - self.amount) < 0
      errors.add(:amount, "para retirada permitida: #{stuff.amount}")
    end
  end

  def self.valid_horary?
    initial_horary = DateTime.now.change({ hour: 12, min: 0, sec: 0 })
    final_horary = DateTime.now.change({ hour: 18, min: 0, sec: 0 })
    DateTime.now.between?(initial_horary, final_horary)
  end
end
