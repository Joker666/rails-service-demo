module V2
    class UserController < ApplicationController
        def create
            begin
                ActiveRecord::Base.transaction do
                    # Create User
                    user = CreateUserService.call(params[:name], params[:email], params[:pass])
                    # Get Product
                    product = GetProductService.call(params[:product_name])
                    # Create Subscription
                    sub = CreateSubscriptionService.call(product[:id], user[:id])
                    # Assign support person
                    AssignSupportService.call(user, 'Jessica')
                    # Update Metrics
                    UpdateMetricsService.call(product)
                    # Send welcome email
                    WelcomeEmailService.call(user)
                    render json: { user: user, subscription: sub }
                end
            rescue StandardError => e
                render json: { error: e }
            end
        end
    end
end