class Resource
  include ActiveModel::Model

  class << self
    def get_all(query_params={})
      query_string = query_params.blank? ? "" : build_query_string(query_params)
      all = conn.get("/#{endpoint_name}#{query_string}")
      objects_hash = JSON.parse(all.body)["data"]
      objects = []
      objects_hash.each do |obj_hash|
        objects.push(self.new(obj_hash))
      end
      objects
    end

    def find_by_id(id)
      obj_json = conn.get("/#{endpoint_name}/#{id}")
      obj_hash = JSON.parse(obj_json.body)
      self.new(obj_hash)
    end

    def destroy_by_id(id)
      conn.delete("/#{endpoint_name}/#{id}")
    end

    def create(params={})
      data_params = {}
      data_params[:data] = params
      create_response_obj = conn.post("/#{endpoint_name}", data_params)
      self.new(JSON.parse(create_response_obj.body))
    end

    private

    def build_query_string(query_params)
      query_string = "?"
      query_params.each do |k, v|
        query_string += "&" unless query_string.last == "?"
        query_string += "#{k}=#{v}"
      end
      query_string
    end

    def endpoint_name
      @name ||= self.to_s.camelcase.underscore.pluralize
    end

    def conn
      @conn ||= Faraday.new(:url => Rails.application.config.api_path) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

  end

end
