module TitlereceiptsHelper
  def title_for_isbn(invoice_no,isbn)
    if isbn
      Invoice.find_by_invoice_no_and_isbn(invoice_no,isbn).title
    else
      "No Title Found"
    end
  end
end
