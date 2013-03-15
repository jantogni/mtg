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

  def self.example_csv()
  	columnas = *accessible_attributes
  	columnas.delete_at(0)
  	#Por algun motivo accesible_attributes revuelve el elemento 0 como "" vacio
    CSV.generate(col_sep: "|") do |csv|
	  csv << columnas
	  all(:limit => 5).each do |card|
	    csv << card.attributes.values_at(*columnas)
      end
    end
  end

  def has_red?
    count = self.manacost.scan(/\{[0-9]*[WBUG]*R[WBUG]*\}/).size
    if count != 0 
      return count
    end
    return false
  end

  def has_blue?
    count = self.manacost.scan(/\{[0-9]*[WBRG]*U[WBRG]*\}/).size
    if count != 0
      return count
    end
    return false
  end

  def has_white?
    count = self.manacost.scan(/\{[0-9]*[RBUG]*W[RBUG]*\}/).size
    if count != 0
      return count
    end
    return false
  end

  def has_black?
    count = self.manacost.scan(/\{[0-9]*[WRUG]*B[WRUG]*\}/).size
    if count != 0
      return count
    end
    return false
  end

  def has_green?
    count = self.manacost.scan(/\{[0-9]*[WBUR]*G[WBUR]*\}/).size
    if count != 0
      return count
    end
    return false
  end

  def has_colorless?
    count = self.manacost.scan(/\{[0-9]+\}/).size
    if count != 0 and not nil
      return count
    end
    return false
  end

  def is_colorless?
    count = self.manacost.scan(/[WBURG]/).size
    if count != 0 and not nil
      return false
    end
    return self.converted_manacost
  end

  def is_multicolor?
    token = 0
    if self.has_red?
      token += 1
      if token == 2
        return true
      end
    end
    if self.has_blue?
      token += 1
      if token == 2
        return true
      end
    end
    if self.has_white?
      token += 1
      if token == 2
        return true
      end
    end
    if self.has_black?
      token += 1
      if token == 2
        return true
      end
    end
    if self.has_green?
      token += 1
      if token == 2
        return true
      end
    end
    return false
  end

end
