class AttendanceRecord < ApplicationRecord
  belongs_to :student

  enum :status, %i[present absent tardy]
  enum :reason, %i[medical dental unexcused religious bereavement other]
end
