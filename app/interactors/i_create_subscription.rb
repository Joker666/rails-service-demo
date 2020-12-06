class ICreateSubscription
    include Interactor

    def call
        sub = Subscription.create(product_id: context.product.id, user_id: context.user.id,
                                  expires_at: Time.now + 30.day)
        context.subscription = sub
    end
end