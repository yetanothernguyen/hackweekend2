module ApplicationHelper
  
  def fb_picture(fb_id,size="square",opts={})
    image_tag "http://graph.facebook.com/#{fb_id}/picture?type=#{size}", opts
  end

  def user_fb_picture(user,size="square",opts={})
  	fb_picture user.authentications.facebook.try(:uid), size, opts.merge({:alt => user.username})
  end
  
end
