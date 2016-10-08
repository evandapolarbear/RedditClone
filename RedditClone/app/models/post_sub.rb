class PostSub < ActiveRecord::Base
  validates :sub, :post, presence: true

  belongs_to :post, inverse_of: :post_subs
  belongs_to :sub, inverse_of: :post_subs
end
