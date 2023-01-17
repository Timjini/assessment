class Comment < ApplicationRecord
  belongs_to :visual
  belongs_to :user
end
