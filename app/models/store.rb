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
    raw_data = BestBuyService.new.find_by_zip(zip)
    stores = raw_data[:stores].map do |raw_store|
      Store.new(raw_store)
    end
    total = raw_data[:total]

    SearchPresenter.new(stores, total)
  end

end
