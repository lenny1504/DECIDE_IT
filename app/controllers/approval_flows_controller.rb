class ApprovalFlowsController < ApplicationController

  def new
    # action triggered from the show of the proposals
    @approval_flow = ApprovalFlow.new
    # @proposal = Proposal.find(params[:proposal_id])
  end

  def create
    @approval_flow = ApprovalFlow.new(approval_flow_params)
    @approval_flow.creator = current_user
    @approval_flow.proposal = Proposal.find(params[:proposal_id])
    if @approval_flow.save
      redirect_to approval_flow_path(@approval_flow), notice: "Your approval flow has been created"
    else
      render "approval_flow/new"
    end
  end

  def show
    @approval_flow = ApprovalFlow.find(params[:id])
  end

  private

  def approval_flow_params
    params.require(:approval_flow).permit(:name, :description)
  end

end
