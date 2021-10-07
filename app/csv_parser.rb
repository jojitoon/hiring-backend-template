require 'csv'

class CSVParser
    def self.parse_string(string, separator = ' + ')
        state_converter = -> (value) {
            States[value.to_sym] || value
        }

        date_converter = -> (value) {
            date_regex = /\d{0,4}-\d{0,2}-\d{0,4}/i
            value.to_s.match(date_regex) ? Helpers.format_date(value.to_s) : value
        }
    
        parsed = []
    
        CSV.parse(string, headers: true, :col_sep => separator, converters: [state_converter, date_converter]) do |row|
            parsed << row.to_h
        end

        parsed
    end
end