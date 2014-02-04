class Reply < ActiveRecord::Base
  belongs_to :topic, lambda { includes(:replies).references(:replies) }

  scope :recent, lambda {
    where(['replies.created_at > ?', 15.minutes.ago]).
      order('replies.created_at DESC').references(:replies)
  }

  validates_presence_of :content
end
