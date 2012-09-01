namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_clients
    make_numbers
  end
end

def make_clients
  99.times do |u|
  	name = Faker::Company.name
    random_num = "0123456789".split('').shuffle.join()
  	dogovor = %(#{rand(99)}/KR/#{rand(99)}-#{rand(999)})
  	lic_schet = rand(99999)
  	status = rand(2)

  	Client.create( :name => name,
  					:dogovor => dogovor,
  					:lic_schet => lic_schet,
  					:status => status )
  end
end

def make_numbers
  Client.all(:limit => 6).each do |client|
    50.times do
      client.numbers.create!(:number => Faker::Base.numerify('49########'))
    end
  end
end