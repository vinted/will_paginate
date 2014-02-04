class Topic < ActiveRecord::Base
  has_many :replies, lambda { order('replies.created_at DESC').references(:replies) }, :dependent => :destroy
  belongs_to :project

  scope :mentions_activerecord, lambda {
    where(['topics.title LIKE ?', '%ActiveRecord%']).references(:topics)
  }
  scope :distinct, lambda {
    select("DISTINCT #{table_name}.*")
  }
end
