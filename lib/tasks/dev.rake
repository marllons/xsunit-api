namespace :dev do
  desc "Gera os sobreviventes para a inicialização do teste"
  task init: :environment do

    puts "\nReseting tables and config data..."

    %x(rails db:drop db:create db:migrate)
    unless $? == 0
      puts "\n====================================================="
      puts "| Ack! An error occurred! Try stop/kill the server. |"
      puts "=====================================================\n\n"
    else
      puts "Registering genders..."
      genders = %w(Male Female Undefined)
      genders.each do |gender|
        Gender.create!(
          description: gender
        )
      end
      puts "Genders were successfully registered!"

      puts "Registering survivors..."
      total_survivors = 25
      total_survivors.times do |s|
          puts "Looking for survivors..."
          Survivor.create!(
            name: Faker::Name.name,
            gender: Gender.all.sample,
            birthday: Faker::Date.between(70.years.ago, 10.years.ago),
            has_abd: false,
            abd_report: 0
          )
          puts "#{s} of #{total_survivors} found"
      end

      puts "Searching for location of survivors..."
      Survivor.all.each do |survivor|
        Location.create!(
          latitude: Faker::Address.latitude,
          longitude: Faker::Address.longitude,
          survivor: survivor
        )
      end
      puts "It seems like everything well! ;)"

      puts "\n============================="
      puts "|   All survivors found,    |\n| don't let them be abduct! |"
      puts "=============================\n"
    end
  end
end
#x
