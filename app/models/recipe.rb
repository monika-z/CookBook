class Recipe < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user
    has_and_belongs_to_many :categories
    
    validates :title, presence: true,
                      length: { minimum: 3 }
    validates :text, presence: true    
end
