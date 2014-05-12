class Book
  attr_accessor :name, :author, :id, :taken, :taken_by

  def is_available_to_issue?
    @taken == false ? true : false
  end

  def issue_book_to_member(member_id)
    @taken = true
    @taken_by = member_id
    puts "\nBook with name '#{@name}' is assigned to member with id #{member_id}\n\n"
  end

  def return_by_member
    @taken = false
    @taken_by = nil
    puts "\nThe book '#{@name}' is returned by member and available to issue\n\n"
  end
end