class CreateSubscription < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :product_id
      t.integer :user_id
      t.datetime :expires_at

      t.timestamps
    end

    add_foreign_key :subscriptions, :products
    add_foreign_key :subscriptions, :users
  end
end
