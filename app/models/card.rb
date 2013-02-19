class Card < ActiveRecord::Base
  attr_accessible :ability, :artist, :card_type, :converted_manacost, :flavor, :loyalty, :manacost, :mtg_id, :name, :number, :power, :rarity, :ruling, :set_code, :set_name, :toughness, :watermark

  def self.import(file)
  	CSV.foreach(file.path, headers: true, col_sep: "|", quote_char: "<") do |row|
  		card = find_by_mtg_id(row["mtg_id"]) || new
  		card.attributes = row.to_hash.slice(*accessible_attributes)
  		card.save!
  	end
  end

  def get_image_url
  	return "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=#{self.mtg_id}&type=card"
  end  
end
