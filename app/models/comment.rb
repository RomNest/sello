class Comment < ActiveRecord::Base
  resourcify
  belongs_to :post
  belongs_to :user

  validates :content, presence: true
end
