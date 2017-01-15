class Paper < ActiveRecord::Base

  belongs_to :author

  validates :title, presence: true
  validates :venue, presence: true
  validates :year, presence: true, :numericality => { :only_integer => true}

end
