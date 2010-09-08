module StarSearch
  class Star
    include MongoMapper::Document

    set_database_name 'star_search'

    key :starred_message_id, String
    key :author, String
    key :email, String
    key :type, String
    key :body, String
    key :posted_at, Time

    validates_uniqueness_of :starred_message_id
    
    scope :default_order, sort('starred_message_id DESC')
    scope :search,      lambda { |query| where(:body => Regexp.new(query)).default_order }
    scope :by_author,   lambda { |author| where(:author => Regexp.new(author, true)).default_order }
    scope :paginated,   lambda { |page| limit(30).offset(page*30).default_order}
  end
end