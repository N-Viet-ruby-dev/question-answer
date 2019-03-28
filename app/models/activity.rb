class Activity < ApplicationRecord
  belongs_to :user

  def message
    case action_type.downcase
    when "learn"
      learn
    when "follow"
      follow
    when "unfollow"
      unfollow
    end
  end

  private

  def learn
    lesson = Lesson.find target_id
    "#{user.name} learned #{lesson.score}/20 in #{lesson.category.title}"
  end

  def follow
    followed_user = User.find target_id
    "#{user.name} followed #{followed_user.name}"
  end

  def unfollow
    unfollowed_user = User.find target_id
    "#{user.name} unfollowed #{unfollowed_user.name}"
  end
end
