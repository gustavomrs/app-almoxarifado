class Departure < ActiveRecord::Base
  audited
  belongs_to :stuff
  validates :stuff_id, :amount, presence: true
end
