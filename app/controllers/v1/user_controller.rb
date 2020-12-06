module V1
    class UserController < ApplicationController
        def create
            ActiveRecord::Base.transaction do
                # Create User
                prev_user = User.find_by email: params[:email]
                if prev_user.present?
                    render json: { error: 'User already exists' }
                    return
                end

                user = User.create(name: params[:name], email: params[:email], pass: params[:pass])

                # Create Subscription
                product = Product.find_by name: params[:product_name]
                unless product.present?
                    render json: { error: "Product doesn't exist" }
                    return
                end

                sub = Subscription.create(product_id: product[:id], user_id: user[:id], expires_at: Time.now + 30.day)

                # Assign support person
                support = Support.find_by name: 'Jessica'
                unless support.present?
                    render json: { error: "Couldn't assign a support person" }
                    return
                end
                user.support_id = support[:id]
                user.save

                # Update Metrics
                Metric.create(user_count: 1, revenue: product.price)

                # Send welcome email

                render json: sub
            end
        end
    end
end

