class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0 }
    validates :bio, length: {minimum: 30}

    def likes
        self.posts.map{|posts| posts.likes}.sum
    end

    def most_liked_post
        self.posts.map{|post| post.likes}.max
    end
end
