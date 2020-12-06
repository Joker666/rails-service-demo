class AssignSupportService < ApplicationService
    attr_reader :user, :support_name

    def initialize(user, support_name)
        @user = user
        @support_name = support_name
    end

    def call
        support = Support.find_by name: @support_name
        raise StandardError, "Couldn't assign a support person" unless support.present?

        @user.support_id = support[:id]
        @user.save
    end
end