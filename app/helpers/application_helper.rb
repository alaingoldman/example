module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
  	# this is the default title when a page has no page_title  otherwise it is default | page_title
    base_title = "Lootfly | Sell Anywhere"
    if page_title.empty?
      base_title
    else
      "#{page_title}"
    end
  end
end