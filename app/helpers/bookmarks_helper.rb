module BookmarksHelper

    def bookmark_path(bookmark)
      case bookmark.source_type
      when 'Reply'
        reply_path(bookmark.source_id)
      when 'Tweet'
        tweet_path(bookmark.source_id)

        # type code here
      end
    end

end
