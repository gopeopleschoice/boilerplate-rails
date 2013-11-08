module Permissions
  class GuestPermission < BasePermission
    def initialize
      allow_all
    end
  end
end
