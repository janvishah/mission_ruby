load 'book.rb'
load 'member.rb'

class Library
  
  def initialize(yaml_file_name)
    @books = []
    @members = []
    load_library_data(yaml_file_name)
  end
  
  def start
    begin
      puts "\n----------"
      puts "Welcome to Library management tool. Choose an option.\n"
      puts "1. View all books."
      puts "2. View all members."
      puts "3. Issue book to a member."
      puts "4. Check book availability."
      puts "5. Accept book returned by a member."
      puts "6. Add book."
      puts "7. To exit\n\n"
      puts "----------\n"
      puts "Choose your option"

      # Choose option to manage library 
      option = gets.chomp
      case option
      # 1. View all books.
      when "1"
        puts "\n\n"
        puts "ID" + "   |   " + "Name" + "   |   " + "Author" + "   |   " + "Taken?" + "   |   " + "Taken_by"
        show_books
      # 2. View all members.
      when "2"       
        puts "\n\n"
        puts "ID" + "   |   " + "Name"
        show_members
      # 3. Issue book to a member.
      when "3"
        issue_book_to_member
      # 4. Check book availability.
      when "4"
        check_book_availability
      # 5. Accept book returned by a member.  
      when "5"
        book_return_by_member
      # 6. Add book.
      when "6"
        add_book
      # 7. EXIT  
      when "7"
        puts "-----EXIT FROM LIBRARY TOOL-----"
      else
        puts "Please enter valid number"
      end 
    end while option != "7"
  end

  private
  # CASE 1
  # Show list of books
  def show_books
    @books.each do |book|
      puts book.id.to_s + "   |   " + book.name + "   |   " + book.author + "   |   " + book.taken.to_s + "   |   " + "#{book.taken_by.to_s == "" ? "nil" : book.taken_by.to_s}"
    end
  end

  # CASE 2
  # Show list of members
  def show_members
    @members.each do |member|
      puts member.id.to_s + "   |   " + member.name
    end
  end

  # Find book if it exist or not
  def find_book_by_id(id)
    @books.each do |book|
      if id == book.id
        return book
      end    
    end
    return nil
  end

  #find member if it exist or not
  def find_member_by_id(id)
    @members.each do |member|
      if member.id == id
        return member
      end
    end
    return nil
  end

  # CASE 3
  def issue_book_to_member
    puts "\nEnter member id to assign book"
    member_id = gets.chomp.to_i
    member = find_member_by_id(member_id)
    if member != nil
      puts "\nEnter book id to issue book"
      book_id = gets.chomp.to_i
      book = find_book_by_id(book_id)
      if book != nil
        if book.is_available_to_issue? == true
          book.issue_book_to_member(member_id)
        else
          puts "\n-----Sorry, book is already issued to member!-----\n\n"
        end
      else
        puts "\n-----Book is not exist-----\n\n"
        issue_book_to_member
      end
    else
      puts "\n-----Member is not valid!-----\n\n"
      issue_book_to_member
    end
  end

  # CASE 4
  def check_book_availability
    puts "\nEnter book id to check availability: "
    book_id = gets.chomp.to_i
    book = find_book_by_id(book_id)
    if book != nil
      if book.is_available_to_issue? == true
        puts "\nThe book '#{book.name}' is available to issue\n\n"
      else
        puts "\nThe book '#{book.name}' is issued to member\n\n" 
      end
    else
      puts "-----invalid book id\n\n-----"
      return check_book_availability
    end
  end

  # CASE 5
  def book_return_by_member
    puts "\nEnter book id to return: "
    book_id = gets.chomp.to_i
    book = find_book_by_id(book_id)
    if book != nil
      if book.is_available_to_issue? == false
        book.return_by_member
      else
        puts "\nThe book '#{book.name}' is not issued to any member please check your book id\n\n" 
      end
    else
      puts "-----invalid book id\n\n-----"
      return book_return_by_member
    end
  end

  # CASE 6
  def add_book
    puts "\nEnter valid book name: "
    book_name = gets.chomp
    puts "\nEnter author of book #{book_name}"
    book_author = gets.chomp
    
    # Add detail of new book in book object
    book = Book.new
    book.id = @books.count + 1
    book.name = book_name
    book.author = book_author
    book.taken = false
    book.taken_by = nil
    @books.push book

    puts "\nA new book with name = '#{book.name}' and Id = '#{book.id}' is created!!\n\n"
  end

  def load_library_data(yaml_file_name)

    @data = YAML.load_file(yaml_file_name)

    @data["books"].each do |book_hash|
      book = Book.new
      book.id = book_hash["id"]
      book.name = book_hash["name"]
      book.author = book_hash["author"]
      book.taken = book_hash["taken"]
      book.taken_by = book_hash["taken_by"]
      @books.push book
    end

    @data["members"].each do |member_hash|
      member = Member.new
      member.id = member_hash["id"]
      member.name = member_hash["name"]
      @members.push member
    end 
  end 

end