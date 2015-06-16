class Ticket < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :board
  enum status: [ "backlog", "current sprint", "in progress", "done" ]
end
