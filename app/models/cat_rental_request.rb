class CatRentalRequest < ApplicationRecord
  STATUSES = [
    "PENDING",
    "APPROVED",
    "DENIED"
  ]

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates_inclusion_of :status, :in => STATUSES

  belongs_to :cat,
    class_name: :Cat,
    foreign_key: :cat_id,
    primary_key: :id
end