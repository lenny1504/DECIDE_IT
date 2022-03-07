class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @proposals = @user.proposals

    @counter_approvals = 0
    @counter_change_requests = 0
    @counter_proposals = 0
  end
end
