class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.text :venue
      t.integer :year

      t.timestamps null: false
    end
  end
end
