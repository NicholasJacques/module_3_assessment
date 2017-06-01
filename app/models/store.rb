class Store
  attr_reader :type,
              :long_name,
              :city,
              :phone,
              :distance


  def initialize(raw_store)
    @type      = raw_store[:storeType]
    @long_name = raw_store[:longName]
    @city      = raw_store[:city]
    @phone     = raw_store[:phone]
    @distance  = raw_store[:distance]
  end

  def self.find_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=all&apiKey=#{ENV['API_KEY']}")
    raw_data = JSON.parse(response.body, symbolize_names: true)
    total = raw_data[:total]

    raw_data[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end



end
