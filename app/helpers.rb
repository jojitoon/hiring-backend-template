class Helpers
    def self.format_date(str)
        Date.parse(str).strftime("%-m/%-d/%Y")
    end
    
    def self.normalize (array, keys = NormalizeKeys)
        array.map { |obj| "#{keys.map {|key| obj[key]}.join(", ") }" }
    end

    def self.sort_data(data, key)
        data.sort_by{|obj| obj[key]}
    end
end
  