module UsersHelper
  #helper for Gravatar to use email with (MD5) using the hexdigest method to translate for Digest library
  #this returns the Gravatar for the given user, custom one when you register email in Gravatar
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
