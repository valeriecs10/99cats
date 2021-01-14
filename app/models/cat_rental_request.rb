class CatRentalRequest < ApplicationRecord
  STATUSES = [
    "PENDING",
    "APPROVED",
    "DENIED"
  ]

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates_inclusion_of :status, :in => STATUSES
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    class_name: :Cat,
    foreign_key: :cat_id,
    primary_key: :id

  def does_not_overlap_approved_request
    overlapping_approved_requests.empty?
  end
  
  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def overlapping_requests
    fill_in_value = self.id ? self.id : 0

    CatRentalRequest.where('end_date >= ?', self.start_date)
      .where('start_date <= ?', self.end_date)
      .where('cat_id = ?', self.cat_id)
      .where.not('id = ?', fill_in_value)
  end

  def approve!
    # CatRentalRequest.transaction do
      if self.id 
        self.update_attribute(:status, "APPROVED")
      else
        self.status = "APPROVED"
        self.save
      end

    #   overlapping_pending_requests.each do |request|
    #     request.update_attribute(status: "DENIED")
    #   end
    # end
    # true
  end

  def deny!
    if self.id 
        self.update_attribute(:status, "DENIED")
      else
        self.status = "DENIED"
        self.save
      end
  end

  # def overlapping_pending_requests

  # end
end