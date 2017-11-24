class RatingLevelsController < ApplicationController
  def index
    @q = RatingLevel.ransack(params[:q])
    @rating_levels = @q.result(:distinct => true).includes(:rating_type).page(params[:page]).per(10)

    render("rating_levels/index.html.erb")
  end

  def show
    @rating_level = RatingLevel.find(params[:id])

    render("rating_levels/show.html.erb")
  end

  def new
    @rating_level = RatingLevel.new

    render("rating_levels/new.html.erb")
  end

  def create
    @rating_level = RatingLevel.new

    @rating_level.rating_level = params[:rating_level]
    @rating_level.order_number = params[:order_number]
    @rating_level.score = params[:score]
    @rating_level.rating_type_id = params[:rating_type_id]

    save_status = @rating_level.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rating_levels/new", "/create_rating_level"
        redirect_to("/rating_levels")
      else
        redirect_back(:fallback_location => "/", :notice => "Rating level created successfully.")
      end
    else
      render("rating_levels/new.html.erb")
    end
  end

  def edit
    @rating_level = RatingLevel.find(params[:id])

    render("rating_levels/edit.html.erb")
  end

  def update
    @rating_level = RatingLevel.find(params[:id])

    @rating_level.rating_level = params[:rating_level]
    @rating_level.order_number = params[:order_number]
    @rating_level.score = params[:score]
    @rating_level.rating_type_id = params[:rating_type_id]

    save_status = @rating_level.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rating_levels/#{@rating_level.id}/edit", "/update_rating_level"
        redirect_to("/rating_levels/#{@rating_level.id}", :notice => "Rating level updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Rating level updated successfully.")
      end
    else
      render("rating_levels/edit.html.erb")
    end
  end

  def destroy
    @rating_level = RatingLevel.find(params[:id])

    @rating_level.destroy

    if URI(request.referer).path == "/rating_levels/#{@rating_level.id}"
      redirect_to("/", :notice => "Rating level deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Rating level deleted.")
    end
  end
end
