class IAssignSupport
    include Interactor

    before do
        support = Support.find_by name: context.support_name
        context.fail!(error: "Couldn't assign a support person") unless support.present?
        context.support = support
    end

    def call
        context.user.support_id = context.support.id
        context.user.save
    end
end
