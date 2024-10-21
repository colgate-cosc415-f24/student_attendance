class Student < ApplicationRecord
  def name
    "#{first.capitalize} #{last.capitalize}"
    # NOT @first.capitalize
  end

  def self.name_search(string)
    first, last = string.split(/ +/)
    Student.where("first like ?", "%#{first}%").or(Student.where("last like ?", "%#{last}%"))
  end
end
