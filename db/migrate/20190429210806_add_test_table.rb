class AddTestTable < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :phone
      t.integer :age
      t.timestamps
      # t.datetime :date, null: false
    end
    add_index :tests, :email, unique: true
  end
end
