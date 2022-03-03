class ProposalsController < ApplicationController

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
    if @proposal.update(proposal_params)
      redirect_to proposal_path(@character)
    else
      render "proposals/edit"
    end
  end

  def show
    @proposal = Proposal.find(params[:id])

  end

  def edit
    @proposal = Proposal.find(params[:id])

    # @proposal = Proposal.new
    # comprobar 1. si el current user es approver de algun step de la proposal
    # comprobar 2. si ese step el status es igual a "in review"
    # si es asi --> mostrar los botones de aprobacion/rechazo/change_request + edit de la proposal
    @action_step = in_review_step_current_user(@proposal)

  end

  def in_review_step_current_user(proposal)
    action_step = nil
    proposal.steps.each do |step|
      if step.approver == current_user && step.status == "in review"
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

  private

  def proposal_params
    params.require(:proposal).permit(:title, :description, :status)
  end
end
