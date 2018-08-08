  module Api
   class ReportSurvivorsApi < ReportSurvivorsController
      def_param_group :report_survivor_get do
        #param :session, String, :desc => "user is logged in", :required => true
        param :regexp_param, /^[0-9]* years/, :desc => "regexp param"
        param :array_param, [100, "one", "two", 1, 2], :desc => "array validator"
        param :boolean_param, [true, false], :desc => "array validator with boolean"
        param :proc_param, lambda { |val|
          val == "param value" ? true : "The only good value is 'param value'."
        }, :desc => "proc validator"
        param :param_with_metadata, String, :desc => "", :meta => [:your, :custom, :metadata]
        error :code => 401, :desc => "Unauthorized"
        error :code => 404, :desc => "Not Found", :meta => {:anything => "you can think of"}
        returns :code => 200, :desc => "a successful response" do
           property :value1, String, :desc => "A string value"
           property :value2, Integer, :desc => "An integer value"
           property :value3, Hash, :desc => "An object" do
             property :enum1, ['v1', 'v2'], :desc => "One of 2 possible string values"
           end
         end
        description "method description"
        formats ['json', 'jsonp', 'xml']
        meta :message => "Some very important info"
        example " 'user': {...} "
        see "report_survivors#index", "link description"
        see :link => "report_survivors#index", :desc => "another link description"
      end
    end
  end
