class PresentationsController < ApplicationController
  skip_before_filter :authenticate_lead!, :only => [:show]
  #before_action :current_lead_must_be_presentation_lead, :only => [:show, :edit, :update, :destroy]

  #def current_user_must_be_presentation_lead
    #presentation = Presentation.find(params[:id])

    #unless current_user == presentation.lead
     # redirect_to :back, :alert => "You are not authorized for that."
   # end
  #end

  def index
    @q = current_lead 
    @presentations = current_lead.presentations.order("created_at ASC")
    # = current_user.presentations.ransack(params[:q])
    #@presentations = @q.result(:distinct => true).includes(:lead, :contributors, :insights).page(params[:page]).per(10)
    # this was mine but its not working, @presentations = current_user.presentations
    render("presentations/index.html.erb")
  end

  def show
    #@insight = Insight.new
    #@contributor = Contributor.new
    @presentation = Presentation.find(params[:id])
    @presentation.insights.each do |insight|
      @vote_score = 0.to_i   
        insight.question_votes.each do |vote| 
          @vote_score = @vote_score + vote[:vote].to_i
        end
      i=Insight.find(insight.id)
      i.vote_score = @vote_score
      i.save
    end
    @presentation_insights_sorted = @presentation.insights.order(vote_score: :desc)
    
    
    
    #LOGIN - should enable viewing by contributors
    
    if current_lead == @presentation.lead
      render("presentations/show.html.erb")
    else
      if cookies[:contributor_id].blank?
        @contributor = Contributor.new
        
        if ok = @contributor.save
          Rails.logger.debug("Contribvutor saved!")
        else
          Rails.logger.debug(@contributor.errors.full_messages)
        end
        cookies[:contributor_id] = @contributor.id
      else
        @contributor = Contributor.find(cookies[:contributor_id])
      end
    render("presentations/show.html.erb")
    end
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
        redirect_to("/presentations/", :notice => "Presentation updated successfully.")
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
