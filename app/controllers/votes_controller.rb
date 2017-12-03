class VotesController < ApplicationController
  skip_before_filter :authenticate_lead!, :only => [:create]
  def index
    @q = Vote.ransack(params[:q])
    @votes = @q.result(:distinct => true).includes(:contributor, :insight).page(params[:page]).per(10)

    render("votes/index.html.erb")
  end

  def show
    @vote = Vote.find(params[:id])

    render("votes/show.html.erb")
  end

  def new
    @vote = Vote.new

    render("votes/new.html.erb")
  end

  def create
    @vote_check=Vote.find_by({:contributor_id => params[:contributor_id], :insight_id =>(params[:insight_id])})
    if @vote_check.present? == true #if the vote already exists
    
    @vote = Vote.find(@vote_check.id) #find the vote by the insight id and the contributor id in params
    @vote.vote = params[:vote] #update just the vote field
    @vote.save #save the vote
    save_status = @vote.save #check the save status and save it in a local variable
        if save_status == true
          referer = URI(request.referer).path

          case referer
          when "/votes/new", "/create_vote"
            redirect_to("/votes")
          else
            redirect_back(:fallback_location => "/presentations/"+params[:presentation_id], :notice => "Vote updated successfully.")
          end
        end
    else #otherwise it should be a new vote
    @vote = Vote.new #create a new vote

    @vote.insight_id = params[:insight_id] #grab the items from the params
    @vote.contributor_id = params[:contributor_id]
    @vote.vote = params[:vote]
    @vote.save

    save_status = @vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/votes/new", "/create_vote"
        redirect_to("/votes")
      else
        redirect_back(:fallback_location => "/presentations/"+params[:presentation_id], :notice => "Vote created successfully.")
      end
    else
      render("votes/new.html.erb")
    end
    end
  end

  def edit
    @vote = Vote.find(params[:id])

    render("votes/edit.html.erb")
  end

  def update
    @vote = Vote.find(params[:id])

    @vote.insight_id = params[:insight_id]
    @vote.contributor_id = params[:contributor_id]
    @vote.vote = params[:vote]

    save_status = @vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/votes/#{@vote.id}/edit", "/update_vote"
        redirect_to("/votes/#{@vote.id}", :notice => "Vote updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Vote updated successfully.")
      end
    else
      render("votes/edit.html.erb")
    end
  end

  def destroy
    @vote = Vote.find(params[:id])

    @vote.destroy

    if URI(request.referer).path == "/votes/#{@vote.id}"
      redirect_to("/", :notice => "Vote deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Vote deleted.")
    end
  end
end
