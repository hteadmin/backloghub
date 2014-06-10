class Forms::Registration

  include ActiveModel::Model

  ATTRIBUTES = [:business_name, :email, :password]
  attr_accessor *ATTRIBUTES


  def user
    @user ||= User.new(email: email, password: password)
  end

  def tenant
    @tenant ||= Tenant.new(name: business_name, subdomain: business_name.parameterize)
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
    return false unless valid?
    if create_objects
      # UserMailer.user_registered(user, tenant)
    else
      false
    end
  end

  private

  def create_objects
    ActiveRecord::Base.transaction do
      user.save!
      tenant.owner_id = user.id
      tenant.save!
    end
  rescue
    false
  end

end