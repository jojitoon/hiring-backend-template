require 'spec_helper'


RSpec.describe 'Helpers Test' do
    describe "Date format test" do
        it "should convert any format of date to m/d/Y" do
          expect(Helpers.format_date('20-10-2021')).to eq '10/20/2021'
        end 
    end

    describe "Sort Data test" do
        it "should sort data by key" do
            data = [{name: "zoo"}, {name: "ant"}]
            expect(data.first[:name]).to eq "zoo"
            data = Helpers.sort_data(data, :name)
            expect(data.first[:name]).to eq "ant"
        end
    end
    
    describe "Normalize data" do
        it "should normalize and array of object to array of strings" do
            data = [{home: "any", name: "zoo"}, {name: "ant", home: "house"}]
            normalized = Helpers.normalize(data, [:name, :home])
            expect(normalized.first).to eq 'zoo, any'
            expect(normalized.last).to eq 'ant, house'
        end
    end
    
end
    