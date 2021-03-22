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
        max_like = 0
        self.posts.select do |post|
            if post.likes > max_like
                post.likes == max_like
            end
            max_like
            byebug
        end
    end
end
