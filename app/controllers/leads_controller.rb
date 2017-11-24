class LeadsController < ApplicationController
  def index
    @leads = Lead.all
  end

  def show
    @lead = Lead.find(params[:id])
  end
end
