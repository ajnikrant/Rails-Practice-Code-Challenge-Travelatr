class Post < ApplicationRecord
belongs_to :blogger, dependent: :destroy
belongs_to :destination, dependent: :destroy

validates :title, presence: true
validates :content, length: {minimum: 100}
end
