class Word < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy

  validates :category_id, presence: true
  validates :japanese, presence: true
  validates :japanese, uniqueness: { scope: :category_id, case_sensitive: false }

  accepts_nested_attributes_for :answers, reject_if: ->(a) { a[:content].blank? }, allow_destroy: true

  def correct_answer
    answers.find_by correct: true
  end
end
