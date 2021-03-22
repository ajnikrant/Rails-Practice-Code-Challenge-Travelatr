class Post < ApplicationRecord
belongs_to :blogger, dependent: :destroy
belongs_to :destination, dependent: :destroy
end
