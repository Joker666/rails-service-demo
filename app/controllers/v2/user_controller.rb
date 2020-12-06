module V2
    class UserController < ApplicationController
        def create
            ActiveRecord::Base.transaction do
                # Create User
                begin
                    CreateUserService.new(params[:name], params[:email], params[:pass]).call

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
                    UserMailer.with(user: user).welcome_email.deliver_later
                    render json: { user: user, subscription: sub }
                rescue StandardError => e
                    render json: { error: e }
                    return
                end
            end
        end
    end
end