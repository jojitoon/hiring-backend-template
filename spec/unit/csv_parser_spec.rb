require 'spec_helper'


RSpec.describe 'CSV Unit Test' do
    describe "with csv string" do
        it "it produces an array of hash" do
          csv_string = "id + name + score\n1 + Tom + 20\n2 + Sandra + 30"
          parsed = CSVParser.parse_string(csv_string)
          expect(parsed.count).to eq 2
          expect(parsed.first["name"]).to eq 'Tom'
        end
    end
end
    