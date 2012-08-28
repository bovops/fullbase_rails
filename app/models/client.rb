class Client < ActiveRecord::Base
  attr_accessible :descr, :dogovor, :lic_schet, :name, :status

  validates :name,	:presence 	=> true,
  					:length		=> { :maximum => 100 },
  					:uniqueness	=> { :case_sensitive => false }

  validates :dogovor,	:presence 	=> true,
  						:length		=> { :maximum => 20 },
  						:uniqueness	=> { :case_sensitive => false }

  validates :lic_schet,	:length		=> { :maximum => 10 }

  validates :status,	:length		=> { :maximum => 1 }

end
