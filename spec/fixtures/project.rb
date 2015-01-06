class Project < ActiveRecord::Base
  has_and_belongs_to_many :developers, lambda { uniq }, :join_table => 'developers_projects'

  has_many :topics

  has_many :replies, :through => :topics do
    def only_recent(params = {})
      where(['replies.created_at > ?', 15.minutes.ago]).references(:replies)
    end
  end
end
