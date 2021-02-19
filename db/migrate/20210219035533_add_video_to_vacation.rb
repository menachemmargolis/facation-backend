class AddVideoToVacation < ActiveRecord::Migration[6.1]
  def change
    add_column :vacations, :video, :string


  end
end
