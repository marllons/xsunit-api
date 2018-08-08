  module Api
    class LocationsApi < LocationsController
      def_param_group :locations_get do
        param :latitude, String, "Latitude where it is located"
        param :longitude, String, "Longitude where it is located"
        param :surviror_id, String, "Id of survivor"
        error :code => 500, :desc => "Internal Server Error"
        error :code => 404, :desc => "Not Found"
        returns :code => 200, :desc => "a successful response" do
          property :value1, String, :desc => "A string value"
          property :value2, Integer, :desc => "An integer value"
        end
        description "Returns all survivors with their respective locations"
        formats ['json']
        example "{
        'latitude': '6.638267602504783',
        'longitude': '64.70043818500704'
        }"
        see "report_survivors#index", "Survivor Reports"
        see "survivors#index", "Survivors"
        #see :link => "report_survivors#index", :desc => "Location"
      end
    end
  end
