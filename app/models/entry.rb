class Entry < ActiveRecord::Base
  audited
  belongs_to :stuff
  validates :stuff_id, :amount, presence: true
  after_save :update_stuff_amount
  scope :ordered, -> { order created_at: :desc }

  def update_stuff_amount
    stuff.update(amount: (stuff.amount + amount))
  end
end
