class Booking < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :offer

  validates :start_date, :end_date, presence: true
  validate :check_overlapping

  def check_overlapping
    overlapping = Booking.where('offer_id = ? AND start_date <= ? AND end_date >= ?', offer_id, end_date, start_date).exists?
    errors.add(:base, 'This slot is not available. Please try other dates') if overlapping
  end
end
