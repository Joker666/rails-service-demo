class CreateSupport < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.string :name

      t.timestamps
    end

    add_index :supports, :name, unique: true
  end
end
