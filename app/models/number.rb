class Number < ActiveRecord::Base
  attr_accessible :client_id, :number

  belongs_to :client

  validates :number, :presence => true, 
                     :length => { :in => 7..10 }

  scope :inactive, where("client_id NULL")

end
