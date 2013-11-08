module Permissions
  def self.permission_for(user)
    if user.nil?
      GuestPermission.new
    elsif user.has_role? :admin
      AdminPermission.new(user)
    else
      MemberPermission.new(user)
    end
  end
end
