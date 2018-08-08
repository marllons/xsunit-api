module Api
  class SurvivorsApi < SurvivorsController
    def_param_group :survivors_get do
      param :name, String, :desc => "Name of survivor"
      param :birthday, Date, :desc => "Date of birth of survivor"
      param :gender_id, ["1 = Male", "2 = Female", "3 = Undefined"], :desc => "Id gender of survivor"
      param :gender, String, :desc => "Gender of survivor"
      param :location, Hash do
        param :latitude, String, "Latitude where it is located"
        param :longitude, String, "Longitude where it is located"
        param :surviror_id, String, "Id of survivor"
      end
      param :report_survivor, Hash do
        param :abd_report, Integer, "Counter of reports. If it is 3, the has_abd key is true"
        param :has_abd, [true, false], "Defines whether the survivor is abducted or not"
        param :surviror_id, Integer, "Id of survivor"
      end
      error :code => 500, :desc => "Internal Server Error"
      error :code => 404, :desc => "Not Found"
      returns :code => 200, :desc => "a successful response" do
        property :value1, String, :desc => "A string value"
        property :value2, Integer, :desc => "An integer value"
      end
      description "Returns all survivors with their respective locations"
      formats ['json']
      example "{
      'id': 1,
      'name': 'Wilbert Hackett',
      'birthday': '1982-04-25T00:00:00-03:00',
      'gender_id': 3,
      'gender': 'undefined',
      'location': {
        'latitude': '6.638267602504783',
        'longitude': '64.70043818500704',
        'survivor_id': 1
      },
      'report_survivor': {
        'abd_report': 0,
        'has_abd': false,
        'survivor_id': 1
      }
}"
      see "report_survivors#index", "Survivor Reports"
      see "genders#index", "Gender of Survivors"
      #see :link => "report_survivors#index", :desc => "Location"
    end

    def_param_group :survivors_post do
      param :name, String, :desc => "Name of survivor"
      param :birthday, Date, :desc => "Date of birth of survivor"
      param :gender_id, ["1 = Male", "2 = Female", "3 = Undefined"], :desc => "Id gender of survivor"
      param :gender, String, :desc => "Gender of survivor"
      param :location, Hash do
        param :latitude, String, "Latitude where it is located"
        param :longitude, String, "Longitude where it is located"
        param :surviror_id, String, "Id of survivor"
      end
      error :code => 500, :desc => "Internal Server Error"
      error :code => 404, :desc => "Not Found"#
      error :code => 200, :desc => "A successful response. Returns:", :meta =>
      {
        :name => "name",
        :birthday => "birthday",
        :gender_id => "gender_id",
        :gender => "gender",
        :location => {
          :latitude => "latitude",
          :longitude => "longitude",
          :survivor_id => "surviror_id"
        },
        :report_survivor => {
          :has_abd => false,
          :abd_report => 0,
          :survivor_id => "surviror_id"
        }
      }
      description "Save a survivors with their respective locations"
      formats ['json']
      example "{
      'name': 'Wilbert Hackett',
      'birthday': '1982-04-25',
      'gender_id': 3,
      'location': {
        'latitude': '6.638267602504783',
        'longitude': '64.70043818500704',
      }
}"
      see "report_survivors#index", "Survivor Reports"
      see "genders#index", "Gender of Survivors"
      #see :link => "report_survivors#index", :desc => "Location"
    end


  end
end
