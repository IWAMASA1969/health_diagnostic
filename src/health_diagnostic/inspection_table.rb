require 'json'

module HealthDiagnostic
  class InspectionTable
    def initialize_inspection_value(rec)
      nil
    end

    def inspection_table_reader(filename)
      recs = load_inspection_table(filename)
      ranges = []
      recs.each do |rec|
        ranges << initialize_inspection_value(rec)
      end
      ranges
    end

    def load_inspection_table(filename)
      JSON.parse(File.read(filename))
    end
  end
end
