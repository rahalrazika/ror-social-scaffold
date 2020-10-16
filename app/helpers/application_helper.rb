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
    current_user.friendships.where(friend_id: user.id, user_id: current_user.id, confirmed: false).count.positive?
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
end
