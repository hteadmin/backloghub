class Registration

  include ActiveModel::Model

  ATTRIBUTES = [:business_name, :email, :password]
  attr_accessor *ATTRIBUTES


  def user
    @user ||= User.new(email: email, password: password)
  end

  def tenant
    @tenant ||= Tenant.new(name: business_name)
  end

  validate do
    [user, tenant].each do |object|
      unless object.valid?
        object.errors.each do |key, values|
          errors[key] = values
        end
      end
    end
  end

  def save
    return unless valid?
    ActiveRecord::Base.transaction do
      user.save!
      tenant.owner_id = user.id
      tenant.save!
    end
  rescue Exception
    false
  end

end