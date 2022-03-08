class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
    @counter_proposals = 0
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.creator = current_user
    if @proposal.save
      redirect_to proposal_path(@proposal.id), notice: 'Proposal was successfully created.'
    else
      render "proposals/new"
    end
  end

  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update(proposal_params)
      redirect_to proposal_path(@proposal.id), notice: 'Proposal was successfully updated.'
    else
      render "proposals/edit"
    end
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def show
    @proposal = Proposal.find(params[:id])
    # @proposal = Proposal.new
    # comprobar 1. si el current user es approver de algun step de la proposal
    # comprobar 2. si ese step el status es igual a "in review"
    # si es asi --> mostrar los botones de aprobacion/rechazo/change_request + edit de la proposal
    @action_step = in_review_step_current_user(@proposal)
    @ordered_steps = @proposal.approval_flow.steps.order('created_at asc') if @proposal.approval_flow
    @comment = Comment.new
    @user = current_user
  end

  def in_review_step_current_user(proposal)
    action_step = nil
    proposal.steps.each do |step|
      if step.approver == current_user && (step.status == "in review" || step.status == "new review")
        action_step = step
      end
    end
    action_step
  end

  def archive
    @proposal.archive = true
  end

  def reject
    @proposal = Proposal.find(params[:id])
    @proposal.status = "rejected"
  end

  def approve
    @proposal = Proposal.find(params[:proposal_id])
    @proposal.status = "approved"
    if @proposal.save
      redirect_to proposal_path(@proposal.id)
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :description, :status, :scope, :budget, :due_date)
  end
end
