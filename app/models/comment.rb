class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  has_many :children, :class_name => "Comment", :foreign_key => "parent_id"
  belongs_to :parent, optional: true, class_name: "Comment", foreign_key: "parent_id"
end
