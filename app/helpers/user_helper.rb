#Used in views/users/index

module UserHelper
  def user_status(user)
    if user.encrypted_password?
      'Authorized'
      #content_tag(:span, '', class: 'glyphicon glyphicon-ok color-success')
      #content_tag(:span, '', class: 'fa fa-check')
    else
      'Invitation Pending'
    end
  end
end