class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user

  def score
    return 0 if answer_ids.blank?

    words = Word.find word_ids.split(",")
    answers = Answer.find answer_ids.split(",")
    correct_answers = words.map(&:correct_answer).flatten

    results = answers & correct_answers
    results.count
  end
end
