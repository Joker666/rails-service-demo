class CreateSubscriptionService < ApplicationService
    attr_reader :product_id, :user_id

    def initialize(product_id, user_id)
        @product_id = product_id
        @user_id = user_id
    end

    def call
        Subscription.create(product_id: @product_id, user_id: @user_id, expires_at: Time.now + 30.day)
    end
end
