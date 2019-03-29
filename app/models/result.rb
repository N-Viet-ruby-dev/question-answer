class Result < ApplicationRecord
  belongs_to :lesson, dependent: :destroy
end
