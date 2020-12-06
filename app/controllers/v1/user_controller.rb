module V1
    class UserController < ApplicationController
        def create
            begin
                ActiveRecord::Base.transaction do
                    # Create User
                    prev_user = User.find_by email: params[:email]
                    raise StandardError, 'User already exists' if prev_user.present?

                    user = User.create(name: params[:name], email: params[:email], pass: params[:pass])

                    # Create Subscription
                    product = Product.find_by name: params[:product_name]
                    raise StandardError, "Product doesn't exist" unless product.present?

                    sub = Subscription.create(product_id: product[:id], user_id: user[:id], expires_at: Time.now + 30.day)

                    # Assign support person
                    support = Support.find_by name: 'Jessica'
                    raise StandardError, "Couldn't assign a support person"  unless support.present?

                    user.support_id = support[:id]
                    user.save

                    # Update Metrics
                    Metric.create(user_count: 1, revenue: product.price)

                    # Send welcome email
                    UserMailer.with(user: user).welcome_email.deliver_later
                    render json: { user: user, subscription: sub }
                end
            rescue StandardError => e
                render json: { error: e }
            end
        end
    end
end

