module StarSearch
  class Star
    include MongoMapper::Document

    set_database_name 'stars'

    key :starred_message_id, String
    key :author, String
    key :email, String
    key :type, String
    key :body, String
    key :posted_at, Time

    validates_uniqueness_of :starred_message_id
  end
end