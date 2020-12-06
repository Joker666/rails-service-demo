class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :pass
      t.integer :support_id

      t.timestamps
    end

    add_foreign_key :users, :supports
    add_index :users, :email, unique: true
  end
end
