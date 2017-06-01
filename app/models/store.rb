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

end
