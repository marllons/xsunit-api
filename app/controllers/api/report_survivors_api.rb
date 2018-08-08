  module Api
    class ReportSurvivorsApi < ReportSurvivorsController
      def_param_group :report_survivors_get do
        param :abd_report, Integer, :desc => "Times the user was reported abducted. If it is 3, the has_abd key is true"
        param :has_abd, [true, false], "Defines whether the survivor is abducted or not"
        param :surviror_id, Integer, "Id of survivor"
        param :name, String, :desc => "Name of survivor"
        param :gender, String, :desc => "Gender of survivor"
        param :birthday, Date, :desc => "Date of birth of survivor"
        error :code => 500, :desc => "Internal Server Error"
        error :code => 404, :desc => "Not Found"
        returns :code => 200, :desc => "a successful response" do
          property :value1, String, :desc => "A string value"
          property :value2, Integer, :desc => "An integer value"
        end
        description "List of all survivors names, by alphabetic order, with an identification to know who was abducted, with percentage of abducted and not abducted survivors."
        formats ['json']
        example "{
        'id': 4,
        'abd_report': 0,
        'has_abd': false,
        'survivor_id': 1,
        'name': 'a Hackett',
        'gender': 'female',
        'birthday': '1982-04-25T00:00:00-03:00'
}"
        see "survivors#index", "Survivor"
        see "genders#index", "Gender of Survivors"
      end

      def_param_group :report_survivors_patch do
        param :abd_report, Integer, :desc => "Times the user was reported abducted. Its limited by 3. If it is 3, the has_abd key is true"
        param :has_abd, [true, false], "Defines whether the survivor is abducted or not"
        param :surviror_id, Integer, "Id of survivor"
        param :name, String, :desc => "Name of survivor"
        param :gender, String, :desc => "Gender of survivor"
        param :birthday, Date, :desc => "Date of birth of survivor"
        error :code => 500, :desc => "Internal Server Error"
        error :code => 404, :desc => "Not Found"
        error :code => 200, :desc => "A successful response. Returns:", :meta =>
        {
          :id => "id",
          :abd_report => "abd_report",
          :has_abd => "has_abd",
          :surviror_id => "surviror_id",
          :name => "name",
          :gender => "gender",
          :birthday => "birthday"
        }
        description "Update report of abductions."
        formats ['json']
        example "{
        'abd_report': 2 //report 2 times abducted
}"
        see "survivors#index", "Survivor"
        see "genders#index", "Gender of Survivors"
        #see :link => "report_survivors#index", :desc => "Location"
      end

      def_param_group :report_survivors do
        param :abd_report, Integer, :desc => "Times the user was reported abducted. Its limited by 3. If it is 3, the has_abd key is true"
        param :has_abd, [true, false], "Defines whether the survivor is abducted or not"
        param :surviror_id, Integer, "Id of survivor"
        param :name, String, :desc => "Name of survivor"
        param :gender, String, :desc => "Gender of survivor"
        param :birthday, Date, :desc => "Date of birth of survivor"
        error :code => 500, :desc => "Internal Server Error"
        error :code => 404, :desc => "Not Found"
        error :code => 200, :desc => "A successful response. Returns the key abd_report incremeted (limit by 3):", :meta =>
        {
          :id => "id",
          :abd_report => "abd_report",
          :has_abd => "has_abd",
          :surviror_id => "surviror_id",
          :name => "name",
          :gender => "gender",
          :birthday => "birthday"
        }
        description "Update report of abductions by GET."
        formats ['json']
        example "{
        'survivor_id': 19,
        'abd_report': 3, //ever increases by 1 (limit by 3)
        'has_abd': true, // if abd_report it's 3 autoset to true. Else autoset false
        'id': 19,
        'name': 'Chauncey Crist',
        'gender': 'female',
        'birthday': '1980-09-23T00:00:00-03:00'
}"
        see "survivors#index", "Survivor"
        see "genders#index", "Gender of Survivors"
        #see :link => "report_survivors#index", :desc => "Location"
      end
    end
  end
