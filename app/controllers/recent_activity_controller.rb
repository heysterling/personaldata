class RecentActivityController < ApplicationController
  def index
    @current_time = DateTime.now
    @json = access_token.get("/api/v1/user/profile").parsed
  end
end
