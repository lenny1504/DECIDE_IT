class StepsController < ApplicationController
  def new
    @step = Step.new
    # @approval_flow = ApprovalFlow.find(params[:approval_flow_id])
  end

  def create
    @step = Step.new(step_params)
    @approval_flow = ApprovalFlow.find(params[:approval_flow_id])
    @step.approval_flow = @approval_flow
    if @step.save
      redirect_to approval_flow_path(@step.approval_flow)
    end
  end

  private

  def step_params
    params.require(:step).permit(:approver, :status)
  end
end
