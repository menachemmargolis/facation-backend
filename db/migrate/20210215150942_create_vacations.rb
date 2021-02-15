class CreateVacations < ActiveRecord::Migration[6.1]
  def change
    create_table :vacations do |t|
      t.string :location
      t.references :user

      t.timestamps
    end
  end
end
