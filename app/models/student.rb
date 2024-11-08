class Student < ApplicationRecord
  validates :first, presence: true
  validates :last, presence: true
  validates :homeroom, presence: true
  validates :graduation_year, presence: true, numericality: { greater_than_or_equal_to: 1970 }
  has_many :attendance_records

  def name
    # NOT @first.capitalize
    "#{first.capitalize} #{last.capitalize}"
  end

  def self.name_search(name)
    Student.where('first LIKE ?', "%#{name}%").or(Student.where('last LIKE ?', "%#{name}%"))
  end
end
