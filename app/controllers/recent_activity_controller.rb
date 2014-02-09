class RecentActivityController < ApplicationController
  def index
    @current_time = DateTime.now
    @profile = access_token.get("/api/v1/user/profile").parsed    
    @json = access_token.get("/api/v1/user/summary/daily/20140120").parsed
    @sum_month = access_token.get("/api/v1/user/summary/daily?pastDays=7").parsed

  end
end


# [{"date"=>"20140203", "summary"=>[{"activity"=>"wlk",
# [{""duration"=>7079.0, "distance"=>8134.0, "steps"=>10762}]},
# [{"{"date"=>"20140204", "summary"=>[{"activity"=>"wlk",
# [{""duration"=>5920.0, "distance"=>7420.0, "steps"=>9748}]},
# [{"{"date"=>"20140205", "summary"=>[{"activity"=>"wlk",
# [{""duration"=>5727.0, "distance"=>7509.0, "steps"=>9149}]},
# [{"{"date"=>"20140206", "summary"=>[{"activity"=>"wlk",
# [{""duration"=>6412.0, "distance"=>7800.0, "steps"=>10102}]},
# [{"{"date"=>"20140207", "summary"=>[{"activity"=>"wlk",
# [{""duration"=>6965.0, "distance"=>8163.0, "steps"=>10974}]},
# [{"{"date"=>"20140208", "summary"=>[{"activity"=>"wlk",
# [{""duration"=>5754.0, "distance"=>7670.0, "steps"=>10387}]},
# [{"{"date"=>"20140209", "summary"=>nil}]

  