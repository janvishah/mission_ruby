class SchoolPrinter
  attr_accessor :extractor_type
  def initialize(extractor_type)
    @extractor_type = extractor_type
  end

  def print_lables_for_all_schools
    schools = @extractor_type.get_all_schools
    puts schools
  end

end