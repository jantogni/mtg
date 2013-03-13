namespace :db do
  desc "Erase and fill database with editions"
  task :populate_edition => :environment do
    puts "Deletings editions"
    Edition.delete_all
    
    puts "Loading XML"
    xml_file = Rails.root.join('doc','cards.xml')
    xml_content = Nokogiri::XML(File.open(xml_file))
    xml_pointer = xml_content.xpath('//mtg_carddatabase/sets/set')

    puts "Starting the import process... go and drink a coffe!"
    count = xml_pointer.count
    
    xml_pointer.each do |edition|
     puts "#{count} to go.."
     count -= 1
     db_edition = Edition.new()
     db_edition.name = edition.at("name").text
     db_edition.code = edition.at("code").text
     db_edition.is_promo = edition.at("code").text
     db_edition.date = Date.parse(edition.at("date").text)
     db_edition.save
    end
   end
end