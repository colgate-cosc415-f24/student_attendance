class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :first
      t.string :last
      t.string :homeroom
      t.integer :graduation_year

      t.timestamps
    end
  end
end
