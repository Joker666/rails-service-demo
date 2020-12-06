module V3
    class UserController < ApplicationController
        def create
            begin
                ActiveRecord::Base.transaction do
                    context = {
                        user_name: params[:name],
                        email: params[:email],
                        user_pass: params[:pass],
                        product_name: params[:product_name],
                        support_name: 'Jessica'
                    }

                    # Create User
                    context = ICreateUser.call(context)
                    raise StandardError, context.error unless context.success?

                    # Get Product
                    context = IGetProduct.call(context)
                    raise StandardError, context.error unless context.success?

                    # Create Subscription
                    context = ICreateSubscription.call(context)
                    raise StandardError, context.error unless context.success?

                    # Assign support person
                    context = IAssignSupport.call(context)
                    raise StandardError, context.error unless context.success?

                    # Update Metrics
                    context = IUpdateMetrics.call(context)
                    raise StandardError, context.error unless context.success?

                    # Send welcome email
                    context = IWelcomeEmail.call(context)
                    raise StandardError, context.error unless context.success?

                    render json: { user: context.user, subscription: context.subscription }
                end
            rescue StandardError => e
                render json: { error: e }
            end
        end
    end
end