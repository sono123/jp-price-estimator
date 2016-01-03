class BusinessCard < ActiveRecord::Base
  belongs_to :print_method
  belongs_to :ink_color
  belongs_to :bleed
  belongs_to :raised_ink
  belongs_to :dimension
  belongs_to :paper_type
  belongs_to :coating
  belongs_to :quantity
  belongs_to :box_count

  def self.search(q)
  	result = where("print_method_id = ? AND ink_color_id = ? AND bleed_id = ? AND raised_ink_id = ? AND dimension_id = ? AND paper_type_id = ? AND coating_id = ? AND quantity_id = ? AND box_count_id = ?", q['print_method_id'], q['ink_color_id'], q['bleed_id'], q['raised_ink_id'], q['dimension_id'], q['paper_type_id'], q['coating_id'], q['quantity_id'], q['box_count_id'])
  end


  def self.similar_products(target)
    same_print_method = BusinessCard.where(print_method_id: target['print_method_id'])
    target_bc = BusinessCard.find(target['id'])
    business_card_scores = []

    same_print_method_arr.each do |bc|
      business_card_scores << generate_score(bc, target_bc)
    end

    results = usiness_card_scores.sort
  end



  private


  def generate_score(bc, target)
    if bc.print_method.print_method.downcase == "pantone offset"
      generate_pantone_offset_score(bc, target)
    elsif bc.print_method.print_method.downcase == "cmyk offset"
      generate_cmyk_offset_score(bc, target)
    elsif bc.print_method.print_method.downcase == "letterpress"
      generate_letterpress_score(bc, target)
    else
      generate_digital_score(bc, target)
    end
  end

  def generate_pantone_offset_score(bc, target)
    score = []
    score << pantone_ink_color_score(bc, target)
    score << pantone_bleed_score(bc) if target.bleed.front == true || target.bleed.back == true
  end

  def generate_cmyk_offset_score(bc, target)
  end

  def generate_letterpress_score(bc, target)
  end

  def generate_digital_score(bc, target)
  end

  def pantone_ink_color_score(b, t)
    b_colors = b.ink_color.front + b.ink_color.back
    t_colors = t.ink_color.front + t.ink_color.back
    diff = nil
    pic_score = nil

    if b_colors > t_colors
      diff = b_colors - t_colors
    else
      diff - t_colors - b_colors
    end

    case diff
    when 0
      pic_score = 15
    when 1
      pic_score = 10
    when 2
      pic_score = 5
    when 3..9
      pic_score = 3
    else
      pic_score = 0
    end
      
    pic_score
  end

  def pantone_bleed_score(b)
    pb_score = 0

    if b.bleed.front == true || b.bleed.back == true
      pb_score = 15
    else
      pb_score = 0
    end
  end

end









