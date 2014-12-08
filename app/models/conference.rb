class Conference < ActiveRecord::Base
  has_many :questions
end
