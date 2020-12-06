class CreateMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :metrics do |t|
      t.integer :user_count
      t.float :revenue

      t.timestamps
    end
  end
end
