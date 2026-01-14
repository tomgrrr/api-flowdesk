class Request < ApplicationRecord
  belongs_to :user

  enum status: {
    draft: 0,
    submitted: 1,
    approved: 2,
    rejected: 3
  }

  validates :title, presence: true
end
