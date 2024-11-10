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
    Student.where("first LIKE ?", "%#{name}%").or(Student.where("last LIKE ?", "%#{name}%"))
  end

  def unexcused_absences
    attendance_records.where(status: :absent).where(reason: :unexcused).count
  end

  def unexcused_tardy
    attendance_records.where(status: :tardy).where(reason: :unexcused).count
  end

  def absence_reasons
    attendance_records.where(status: :absent).group(:reason).count
  end

  def tardy_reasons
    attendance_records.where(status: :tardy).group(:reason).count
  end
end
