class ApprovalFlowsController < ApplicationController

  def new
    @approval_flow = ApprovalFlow.new
    @proposal = Proposal.find(params[:proposal_id])
  end

  def create
    @approval_flow = ApprovalFlow.new(approval_flow_params)
    @approval_flow.creator = current_user
    @approval_flow.proposal = Proposal.find(params[:proposal_id])
    if @approval_flow.save
      redirect_to proposal_path(@approval_flow.proposal), notice: "Your approval flow has been created"
    else
      # not sure about this else
      render "approval_flow/new"
    end
  end

  def show
    @approval_flow = ApprovalFlow.find(params[:id])
    @proposal = @approval_flow.proposal
    # @step = Step.new
    @ordered_steps = @approval_flow.steps.order('created_at asc') if @approval_flow.steps
    @step = Step.new
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to approval_flow_path(@step.approval_flow), notice: "The step has been eliminated"
  end

  def approve
    @step = Step.find(params[:id])
    @step.status = "approved"
  end

  def reject
    @step = Step.find(params[:id])
    @step.status = "rejected"
  end

  def change_request
    @step = Step.find(params[:id])
    @step.status = "change request"
  end

  private

  def approval_flow_params
    params.require(:approval_flow).permit(:name, :description)
  end

end
