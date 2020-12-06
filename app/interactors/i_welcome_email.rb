class IWelcomeEmail
    include Interactor

    def call
        UserMailer.with(user: context.user).welcome_email.deliver_later
    end
end
