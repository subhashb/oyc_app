module TitlesHelper
  def title_of_isbn(isbn)
    if isbn
      Title.find_by_isbn(isbn).title
    else
      "No Title Found"
    end
  end
end
