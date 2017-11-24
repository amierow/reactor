class InsightsController < ApplicationController
  def index
    @insights = Insight.all

    render("insights/index.html.erb")
  end

  def show
    @insight = Insight.find(params[:id])

    render("insights/show.html.erb")
  end

  def new
    @insight = Insight.new

    render("insights/new.html.erb")
  end

  def create
    @insight = Insight.new

    @insight.presentation_id = params[:presentation_id]
    @insight.contributor_id = params[:contributor_id]
    @insight.insght_type_id = params[:insght_type_id]
    @insight.title = params[:title]
    @insight.body = params[:body]

    save_status = @insight.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/insights/new", "/create_insight"
        redirect_to("/insights")
      else
        redirect_back(:fallback_location => "/", :notice => "Insight created successfully.")
      end
    else
      render("insights/new.html.erb")
    end
  end

  def edit
    @insight = Insight.find(params[:id])

    render("insights/edit.html.erb")
  end

  def update
    @insight = Insight.find(params[:id])

    @insight.presentation_id = params[:presentation_id]
    @insight.contributor_id = params[:contributor_id]
    @insight.insght_type_id = params[:insght_type_id]
    @insight.title = params[:title]
    @insight.body = params[:body]

    save_status = @insight.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/insights/#{@insight.id}/edit", "/update_insight"
        redirect_to("/insights/#{@insight.id}", :notice => "Insight updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Insight updated successfully.")
      end
    else
      render("insights/edit.html.erb")
    end
  end

  def destroy
    @insight = Insight.find(params[:id])

    @insight.destroy

    if URI(request.referer).path == "/insights/#{@insight.id}"
      redirect_to("/", :notice => "Insight deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Insight deleted.")
    end
  end
end
