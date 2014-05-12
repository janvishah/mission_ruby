class SchoolPrinter

  def initialize(extractor)
    @extractor = extractor
  end

  def print_lables_for_all_schools
    puts @extractor.get_all_schools
  end

end