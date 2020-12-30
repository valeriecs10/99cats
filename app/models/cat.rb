class Cat < ApplicationRecord
  COLORS = [
    "Black",
    "Grey",
    "White",
    "Orange",
    "Tabby"
  ]

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validate :sex_format
  validates_inclusion_of :color, :in => COLORS
  
    def age
      obj_age = Date.today.year - birth_date.year 
      unless Date.today.month >= birth_date.month && Date.today.day >= birth_date.day
        obj_age -= 1
      end
      obj_age
    end

  def sex_format
    unless sex == 'M' || sex == "F"
      errors[:sex] << "must be 'M' or 'F'"
    end
  end
end