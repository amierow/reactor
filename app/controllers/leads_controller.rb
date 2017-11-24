class LeadsController < ApplicationController
  def index
    @leads = Lead.page(params[:page]).per(10)
  end

  def show
    @lead = Lead.find(params[:id])
  end
end
