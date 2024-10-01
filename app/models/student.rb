class Student < ApplicationRecord
  def name
    "#{first.capitalize} #{last.capitalize}"
    # NOT @first.capitalize
  end

end
