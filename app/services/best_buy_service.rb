class BestBuyService

  def initialize
    @connection = Faraday.new('https://api.bestbuy.com')
  end

  def find_by_zip(zip)
    response = connection.get("/v1/stores(area(#{zip},25))?format=json&show=all&apiKey=#{ENV['API_KEY']}")
    parse(response)[:stores]
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

attr_reader :connection

end