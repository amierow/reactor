class RatingTypesController < ApplicationController
  def index
    @q = RatingType.ransack(params[:q])
    @rating_types = @q.result(:distinct => true).includes(:question_ratings, :rating_levels).page(params[:page]).per(10)

    render("rating_types/index.html.erb")
  end

  def show
    @rating_level = RatingLevel.new
    @rating = Rating.new
    @rating_type = RatingType.find(params[:id])

    render("rating_types/show.html.erb")
  end

  def new
    @rating_type = RatingType.new

    render("rating_types/new.html.erb")
  end

  def create
    @rating_type = RatingType.new

    @rating_type.rating_type = params[:rating_type]

    save_status = @rating_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rating_types/new", "/create_rating_type"
        redirect_to("/rating_types")
      else
        redirect_back(:fallback_location => "/", :notice => "Rating type created successfully.")
      end
    else
      render("rating_types/new.html.erb")
    end
  end

  def edit
    @rating_type = RatingType.find(params[:id])

    render("rating_types/edit.html.erb")
  end

  def update
    @rating_type = RatingType.find(params[:id])

    @rating_type.rating_type = params[:rating_type]

    save_status = @rating_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rating_types/#{@rating_type.id}/edit", "/update_rating_type"
        redirect_to("/rating_types/#{@rating_type.id}", :notice => "Rating type updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Rating type updated successfully.")
      end
    else
      render("rating_types/edit.html.erb")
    end
  end

  def destroy
    @rating_type = RatingType.find(params[:id])

    @rating_type.destroy

    if URI(request.referer).path == "/rating_types/#{@rating_type.id}"
      redirect_to("/", :notice => "Rating type deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Rating type deleted.")
    end
  end
end
