class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates_presence_of :body
  validates_presence_of :title

  def self.search(words)
    matches = []
    words.split(' ').each do |word|
      matches << Question.all.select { |q| q.title.include?(word) || q.body.include?(word) }
    end
    matches.flatten.uniq
  end
end