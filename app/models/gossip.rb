class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :join_table_gossip_comments
  has_many :tags ,through: :join_table_gossip_comments
  has_many :likes
end
