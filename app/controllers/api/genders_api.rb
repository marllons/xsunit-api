module Api
  class GendersApi < GendersController
    def_param_group :genders_get do
      param :id, Integer, :desc => "Id of gender"
      param :description, String, :desc => "Description of gender"
      error :code => 500, :desc => "Internal Server Error"
      error :code => 404, :desc => "Not Found"
      returns :code => 200, :desc => "a successful response" do
        property :value1, String, :desc => "A string value"
        property :value2, Integer, :desc => "An integer value"
      end
      description "Returns all genders with their respective descriptions"
      formats ['json']
      example "{
      'id': 1,
      'description': 'Male',
}"
      see "report_survivors#index", "Survivor Reports"
      see "survivors#index", "Survivors"
      #see :link => "report_survivors#index", :desc => "Location"
    end

    def_param_group :genders_post do
      param :description, String, :desc => "Description of gender"
      error :code => 500, :desc => "Internal Server Error"
      error :code => 404, :desc => "Not Found"#
      error :code => 200, :desc => "A successful response. Returns:", :meta =>
      {
        :id => "id",
        :description => "description",
        :created_at => "created_at",
        :updated_at => "updated_at"
      }
      description "Save a new gender of survivors"
      formats ['json']
      example "{
      'description': 'Male'
}"
      see "report_survivors#index", "Survivor Reports"
      see "survivors#index", "Survivors"
      #see :link => "report_survivors#index", :desc => "Location"
    end
  end
end
