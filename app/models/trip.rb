class Trip < Resource
  attr_accessor :id, :location_name, :latlong, :duration_days,
                :name, :created_at, :updated_at
end
