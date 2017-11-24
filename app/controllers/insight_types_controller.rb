class InsightTypesController < ApplicationController
  def index
    @insight_types = InsightType.all

    render("insight_types/index.html.erb")
  end

  def show
    @insight = Insight.new
    @insight_type = InsightType.find(params[:id])

    render("insight_types/show.html.erb")
  end

  def new
    @insight_type = InsightType.new

    render("insight_types/new.html.erb")
  end

  def create
    @insight_type = InsightType.new

    @insight_type.insight_type = params[:insight_type]

    save_status = @insight_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/insight_types/new", "/create_insight_type"
        redirect_to("/insight_types")
      else
        redirect_back(:fallback_location => "/", :notice => "Insight type created successfully.")
      end
    else
      render("insight_types/new.html.erb")
    end
  end

  def edit
    @insight_type = InsightType.find(params[:id])

    render("insight_types/edit.html.erb")
  end

  def update
    @insight_type = InsightType.find(params[:id])

    @insight_type.insight_type = params[:insight_type]

    save_status = @insight_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/insight_types/#{@insight_type.id}/edit", "/update_insight_type"
        redirect_to("/insight_types/#{@insight_type.id}", :notice => "Insight type updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Insight type updated successfully.")
      end
    else
      render("insight_types/edit.html.erb")
    end
  end

  def destroy
    @insight_type = InsightType.find(params[:id])

    @insight_type.destroy

    if URI(request.referer).path == "/insight_types/#{@insight_type.id}"
      redirect_to("/", :notice => "Insight type deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Insight type deleted.")
    end
  end
end
