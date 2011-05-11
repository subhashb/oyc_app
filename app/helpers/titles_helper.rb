module TitlesHelper
  def title_for_isbn(isbn)
    if isbn
      Isbn.find_by_isbn(isbn).title
    else
      "No Title Found"
    end
  end
end
