class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    dollar_format = CSVParser.parse_string(@params[:dollar_format], ' $ ')
    percent_format = CSVParser.parse_string(@params[:percent_format], ' % ')
    final_data = dollar_format + percent_format
    final_data = Helpers.sort_data(final_data, @params[:order].to_s)
    Helpers.normalize(final_data)
  end

  private

  attr_reader :params
end
