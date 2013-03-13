namespace :db do
  desc "Erase and fill database with cards"
  task :populate => :environment do
    puts "Deletings cards"
    Card.delete_all
    
    puts "Loading XML"
    xml_file = Rails.root.join('doc','cards.xml')
    xml_content = Nokogiri::XML(File.open(xml_file))
    xml_pointer = xml_content.xpath('//mtg_carddatabase/cards/card')

    puts "Starting the import process... go and drink a coffe!"
    count = xml_pointer.count
    
    xml_pointer.each do |card|
     puts "#{count} to go.."
     count -= 1
     db_card = Card.new()
     db_card.watermark = card.at("watermark").text
     db_card.mtg_id = card.at("id").text
     db_card.name = card.at("name").text
     db_card.set_code = card.at("set").text
     db_card.card_type = card.at("type").text
     db_card.rarity = card.at("rarity").text
     db_card.manacost = card.at("manacost").text
     db_card.converted_manacost = card.at("converted_manacost").text
     db_card.power = card.at("power").text
     db_card.toughness = card.at("toughness").text
     db_card.loyalty = card.at("loyalty").text
     db_card.ability = card.at("ability").text.gsub!(/#(.*?)#/,'_#\1#_')
     db_card.flavor = card.at("flavor").text.gsub!(/#(.*?)#/,'_#\1#_')
     db_card.artist = card.at("artist").text
     db_card.ruling = card.at("ruling").text
     db_card.number = card.at("number").text
     db_card.save
    end
   end
end