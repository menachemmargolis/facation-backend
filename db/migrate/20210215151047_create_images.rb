class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :url
      t.references :vacation

      t.timestamps
    end
  end
end
