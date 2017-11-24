class ContributorsController < ApplicationController
  def index
    @contributors = Contributor.page(params[:page]).per(10)

    render("contributors/index.html.erb")
  end

  def show
    @rating = Rating.new
    @vote = Vote.new
    @insight = Insight.new
    @contributor = Contributor.find(params[:id])

    render("contributors/show.html.erb")
  end

  def new
    @contributor = Contributor.new

    render("contributors/new.html.erb")
  end

  def create
    @contributor = Contributor.new

    @contributor.presentation_id = params[:presentation_id]
    @contributor.name = params[:name]
    @contributor.email = params[:email]
    @contributor.position = params[:position]
    @contributor.department = params[:department]
    @contributor.facility = params[:facility]

    save_status = @contributor.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/contributors/new", "/create_contributor"
        redirect_to("/contributors")
      else
        redirect_back(:fallback_location => "/", :notice => "Contributor created successfully.")
      end
    else
      render("contributors/new.html.erb")
    end
  end

  def edit
    @contributor = Contributor.find(params[:id])

    render("contributors/edit.html.erb")
  end

  def update
    @contributor = Contributor.find(params[:id])

    @contributor.presentation_id = params[:presentation_id]
    @contributor.name = params[:name]
    @contributor.email = params[:email]
    @contributor.position = params[:position]
    @contributor.department = params[:department]
    @contributor.facility = params[:facility]

    save_status = @contributor.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/contributors/#{@contributor.id}/edit", "/update_contributor"
        redirect_to("/contributors/#{@contributor.id}", :notice => "Contributor updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Contributor updated successfully.")
      end
    else
      render("contributors/edit.html.erb")
    end
  end

  def destroy
    @contributor = Contributor.find(params[:id])

    @contributor.destroy

    if URI(request.referer).path == "/contributors/#{@contributor.id}"
      redirect_to("/", :notice => "Contributor deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Contributor deleted.")
    end
  end
end
