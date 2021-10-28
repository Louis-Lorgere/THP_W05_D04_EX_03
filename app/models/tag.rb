class Tag < ApplicationRecord
  has_many :join_table_gossip_comments
  has_many :gossips ,through: :join_table_gossip_comments
end
