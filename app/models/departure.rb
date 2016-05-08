class Departure < ActiveRecord::Base
  audited
  belongs_to :stuff
  validates :stuff_id, :amount, presence: true
  validate :amount_enough_to_departure?
  after_save :update_stuff_amount
  scope :ordered, -> { order created_at: :desc }

  def update_stuff_amount
    stuff.update(amount: (stuff.amount - amount))
  end

  def amount_enough_to_departure?
    if (stuff.amount - amount) < 0
      errors.add(:amount, "para retirada permitida: #{stuff.amount}")
    end
  end
end
