require "./school_printer"
require "./cbse_school_extractor"
require "./gseb_school_extractor"

# Do not change line 8 & 11

cbse_school_printer = SchoolPrinter.new(CbseSchoolExtractor.new)
cbse_school_printer.print_lables_for_all_schools

gseb_school_printer = SchoolPrinter.new(GsebSchoolExtractor.new)
gseb_school_printer.print_lables_for_all_schools