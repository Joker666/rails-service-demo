class ICreateUser
  include Interactor

  def call
    prev_user = User.find_by email: context.email
      context.fail!(error: 'User already exists') if prev_user.present?
      user = User.create(name: context.user_name, email: context.email, pass: context.user_pass)
      context.user = user
  end
end
