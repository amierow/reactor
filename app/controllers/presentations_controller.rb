class PresentationsController < ApplicationController
  before_action :current_user_must_be_presentation_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_presentation_lead
    presentation = Presentation.find(params[:id])

    unless current_user == presentation.lead
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @presentations = current_user.presentations.page(params[:page]).per(10)

    render("presentations/index.html.erb")
  end

  def show
    @presentation = Presentation.find(params[:id])

    render("presentations/show.html.erb")
  end

  def new
    @presentation = Presentation.new

    render("presentations/new.html.erb")
  end

  def create
    @presentation = Presentation.new

    @presentation.lead_id = params[:lead_id]
    @presentation.date = params[:date]
    @presentation.name = params[:name]

    save_status = @presentation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/presentations/new", "/create_presentation"
        redirect_to("/presentations")
      else
        redirect_back(:fallback_location => "/", :notice => "Presentation created successfully.")
      end
    else
      render("presentations/new.html.erb")
    end
  end

  def edit
    @presentation = Presentation.find(params[:id])

    render("presentations/edit.html.erb")
  end

  def update
    @presentation = Presentation.find(params[:id])
    @presentation.date = params[:date]
    @presentation.name = params[:name]

    save_status = @presentation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/presentations/#{@presentation.id}/edit", "/update_presentation"
        redirect_to("/presentations/#{@presentation.id}", :notice => "Presentation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Presentation updated successfully.")
      end
    else
      render("presentations/edit.html.erb")
    end
  end

  def destroy
    @presentation = Presentation.find(params[:id])

    @presentation.destroy

    if URI(request.referer).path == "/presentations/#{@presentation.id}"
      redirect_to("/", :notice => "Presentation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Presentation deleted.")
    end
  end
end
