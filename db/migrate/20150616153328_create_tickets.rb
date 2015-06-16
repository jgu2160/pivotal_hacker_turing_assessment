class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :desc
      t.integer :status, default: 0
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
