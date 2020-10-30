class Booking < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :offer

  validates :start_date, :end_date, presence: true
  validate :check_overlapping

  def check_overlapping
    overlap = Booking.where('offer_id = ? AND start_date <= ? AND end_date >= ?', offer_id, end_date, start_date)

    if overlap.exists?
      period = overlap.pluck(:start_date, :end_date)
      booked_period = period.map {|x| x.join(' => ')}.join(', ')
      errors.add(:base, "This slot is not available. It has been booked on these dates: #{booked_period}")
    end
  end
end
