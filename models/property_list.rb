require('pg')

class PropertyListing

attr_accessor :address, :value, :rental_status, :year_built

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @value = options['value'].to_i
    @rental_status = options['rental_status']
    @year_built = options['year_built'].to_i
  end

  def save
    db = PG.connect({ dbname: 'property', host: 'localhost'})   #just defining the method, the method is actually called in the console file at the bottom .save
    sql = "INSERT INTO property_listings
      (address, value, rental_status, year_built)
      VALUES
        ($1, $2, $3, $4)
        RETURNING * "
      values = [@address, @value, @rental_status, @year_built]
      db.prepare("save", sql)
      @id = db.exec_prepared("save", values)[0]['id'].to_i  #don't forget to execute the method!
      db.close
    end

    def PropertyListing.all
      db = PG.connect({ dbname: 'property', host: 'localhost'})
      sql = "SELECT * FROM property_listings"
      db.prepare("all", sql)
      properties_array = db.exec_prepared("all")
      db.close
      return properties_array.map {|property| PropertyListing.new(property)}
    end

end
