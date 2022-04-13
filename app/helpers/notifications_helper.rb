# frozen_string_literal: true

module NotificationsHelper
  def content(notification)
    case notification.source_type
    when 'Reply'
      notification.source.content
    when 'Tweet'
      notification.source.source.content
    when 'Like'
      notification.source.likeable.content
    else
      ''
    end
  end

  def text(notification)
    case notification.source_type
    when 'Relation'
      'followed you'
    when 'Reply'
      'replied to your tweet'
    when 'Tweet'
      'Retweeted your Tweet'
    when 'Like'
      'liked your Tweet'
    else
      # type code here
    end
  end

  def path(notification)
    case notification.source_type
    when 'Relation'
      user_path(notification.sender)
    when 'Reply'
      reply_path(notification.source.replyable_id)
    when 'Tweet'
      tweet_path(notification.source.source_id)
    when 'Like'
      tweet_path(notification.source.likeable_id)
    else
      # type code here
    end
  end
end
