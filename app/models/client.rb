# coding: utf-8

class Client < ActiveRecord::Base
  attr_accessible :descr, :dogovor, :lic_schet, :name, :status

  has_many :numbers

  validates :name,	:presence 	=> true,
  					:length		=> { :maximum => 100 },
  					:uniqueness	=> { :case_sensitive => false }

  validates :dogovor,	:presence 	=> true,
  						:length		=> { :maximum => 20 },
  						:uniqueness	=> { :case_sensitive => false }

  validates :lic_schet,	:length		=> { :maximum => 10 }

  validates :status,	:length		=> { :maximum => 1 }

  scope :active, where("status = 1")

  def get_status_display
  	return 'Приостановлен' if self.status == 0
  	return 'Активен' if self.status == 1
  end

end
