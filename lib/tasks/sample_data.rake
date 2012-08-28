namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_clients
  end
end

def make_clients
  99.times do |u|
  	name = Faker::Company.name
    random_num = "0123456789".split('').shuffle.join()
  	dogovor = %(#{random_num[0..1]}/KR/#{random_num[2..3]}-#{random_num[4..6]})
  	lic_schet = "0123456789".split('').shuffle.last(5).join()
  	status = "01".split('').shuffle.last(1).join()

  	Client.create( :name => name,
  					:dogovor => dogovor,
  					:lic_schet => lic_schet,
  					:status => status )
  end
end