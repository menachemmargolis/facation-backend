class AddCompanionRefToVacations < ActiveRecord::Migration[6.1]
  def change
    add_reference :vacations, :companion, foreign_key: true
  end
end
