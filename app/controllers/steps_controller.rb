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

  def approve
    @step = Step.find(params[:id])
    @step.status = "approved"
    @step.update
    # if new_step exists change status to in review, if it does not, activate the final approval button
    @flow = @step.approval_flow
    @flow.steps.each_with_index do |step, index|
      if step == @step
        if @flow.steps[index + 1]
          @flow.steps[index + 1].status = "in review"
          @flow.steps[index + 1].update
        else
          # activate final approval button
        end
      end
    end
  end

  def reject
    @step = Step.find(params[:id])
    @step.status = "rejected"
    @step.update
    @step.approval_flow.proposal.status = "rejected"
    @step.approval_flow.proposal.update
  end

  def request_change
    @step = Step.find(params[:id])
    @step.status = "change request"
    @step.update
    # send notification to initiator
  end

  private

  def step_params
    params.require(:step).permit(:approver)
  end
end
