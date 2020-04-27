module CurrentUserConcern
	extend ActiveSupport::Concern

  def current_user
  	super || guest_user
  end

  # def guest_user_old_using_no_object_pattern
  # 	OpenStruct.new(name: "Guest User", 
  # 								first_name: "Guest", 
  # 								last_name: "User", 
  # 								email: "guest@example.com"
  # 								)
  # end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end
end

