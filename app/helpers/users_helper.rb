module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, size: 90)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: full_name(user), class: "gravatar")
  end

  # Defines a full name helper for the user model.
  def full_name(user)
    user.first_name + " " + user.last_name
  end
end
