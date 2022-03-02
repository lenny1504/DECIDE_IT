class StepsController < ApplicationController
  def new
    @step = Step.new
    @approval_flow = ApprovalFlow.find(params[:approval_flow_id])
    @proposal = Proposal.find(params[:proposal_id])
  end

  def create
    @step = Step.new(status: "created")
    # params = step_params
    @approver = User.find_by(email: step_params["approver"])
    @step.approver = User.find_by(email: step_params["approver"])
    @approval_flow = ApprovalFlow.find(params[:approval_flow_id])
    @step.approval_flow = @approval_flow
    if @step.save
      redirect_to approval_flow_path(@approval_flow)
    end
  end

  private

  def step_params
    params.require(:step).permit(:approver)
  end
end
