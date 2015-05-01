class CreateLights < ActiveRecord::Migration
  def change
    create_table :lights do |t|
      t.integer :amount
      t.string :type
      t.string :colors
      t.integer :amount_replaced
      t.boolean :our_stringer
      t.text :comments

      t.timestamps
    end
  end
end
