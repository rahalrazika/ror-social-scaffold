module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def request_recieved?(user)
    user.friendships.where(friend_id: current_user.id, user_id: user.id, confirmed: false).count.positive?
  end

  def current_user_is_user?(user)
    current_user.id == user.id
  end

  def request_sent?(user)
    current_user.friendships.where(friend_id: user.id, user_id: current_user.id, confirmed: false).count.positive?
  end

  def friend?(user)
    current_user.friendships.where(friend_id: user.id, user_id: current_user.id, confirmed: true).count.positive?
  end

  def friend_reverse?(user)
    user.friendships.where(user_id: user.id, friend_id: current_user.id, confirmed: true).count.positive?
  end

  def post_belong_to_friend?(post)
    Friendship.where(friend_id: post.user.id, confirmed: true).count.positive?
  end

  def post_belong_to_user?(post)
    Friendship.where(user_id: post.user.id, confirmed: true).count.positive?
  end

  def friend_requests(user)
    user_count = user.friendships.where(friend_id: current_user.id, user_id: user.id, confirmed: false).count
    html = ''
    if user_count.positive?
      html << "<li> Friend Request: #{user.name} </li>"
      html << button_to('Accept Friend Request', friendship_path(user), method: :put)
      html << button_to('Decline Request', friendship_path(current_user.id), method: :delete)
    end
    html.html_safe
  end

  def users_list(user)
    html = ''
    unless current_user_is_user?(user)
      html << "<li> Name: #{user.name}</li>"
      if request_sent?(user)
        html << '<p>Friendship Request Pending</p>'
        html << button_to('Cancel Request', friendship_path(user.id), method: :delete)
      elsif friend?(user)
        html << button_to('Unfriend', friendship_path(user.id), method: :delete)
      elsif friend_reverse?(user)
        html << button_to('Unfriend', friendship_path(current_user.id), method: :delete)
      elsif request_sent?(user)
        html << button_to('Decline Request', friendship_path(current_user.id), method: :delete)
        html << button_to('Accept Friend Request', friendship_path(user), method: :put)
      else
        html << button_to('Add Friend', friendships_path, params: { friend_id: user.id })
      end
      html << "<span class='profile-link'>"
      html << link_to('See Profile', user_path(user), class: 'profile-link')
      html << '</span>'
    end
    html.html_safe
  end

  def user_show_friendship_button(user)
    html = ''
    html << "<h2> Name: #{user.name}</h2>"
    unless current_user_is_user?(user)
      if request_sent?(user)
        html << '<p>Friendship Request Pending</p>'
        html << button_to('Cancel Request', friendship_path(user.id), method: :delete)
      elsif friend?(user)
        html << button_to('Unfriend', friendship_path(user.id), method: :delete)
      elsif friend_reverse?(user)
        html << button_to('Unfriend', friendship_path(current_user.id), method: :delete)
      elsif request_sent?(user)
        html << button_to('Decline Request', friendship_path(current_user.id), method: :delete)
        html << button_to('Accept Friend Request', friendship_path(user), method: :put)
      else
        html << button_to('Add Friend', friendships_path, params: { friend_id: user.id })
      end
    end
    html.html_safe
  end
end
