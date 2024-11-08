class CreateAttendanceRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :attendance_records do |t|
      t.references :student, null: false, foreign_key: true
      t.date :date
      t.integer :status
      t.integer :reason
      t.text :description

      t.timestamps
    end
  end
end
