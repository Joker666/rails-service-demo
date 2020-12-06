class CreateUserService < ApplicationService
    attr_reader :name, :email, :pass

    def initialize(name, email, pass)
        @name = name
        @email = email
        @pass = pass
    end

    def call
        prev_user = User.find_by email: @email
        raise StandardError, 'User already exists' if prev_user.present?

        User.create(name: @name, email: @email, pass: @pass)
    end
end