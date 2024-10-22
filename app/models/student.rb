class Student < ApplicationRecord
  def name
    # NOT @first.capitalize
    "#{first.capitalize} #{last.capitalize}"
  end

  def self.name_search(name)
    Student.where('first LIKE ?', "%#{name}%").or(Student.where('last LIKE ?', "%#{name}%"))
  end
end
