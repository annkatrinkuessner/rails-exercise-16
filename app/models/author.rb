class Author < ActiveRecord::Base

  has_and_belongs_to_many :papers

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :homepage, presence: true

  def name
      self.first_name + ' ' + self.last_name
  end


end
