class SchoolPrinter

  def initialize(mode)
    @mode = mode
  end

  def print_lables_for_all_schools

    if @mode == "cbse"
      cbse = CbseSchoolExtractor.new
      puts cbse.get_all_schools
    elsif @mode == "gseb"
      gseb = GsebSchoolExtractor.new
      puts gseb.get_all_schools
    end
      
  end

end