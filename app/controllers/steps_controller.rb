class StepsController < ApplicationController
  def new
    @step = Step.new
    @approval_flow = ApprovalFlow.find(params[:approval_flow_id])
    @proposal = Proposal.find(params[:proposal_id])
  end

  def create
    @step = Step.new(status: "created")
    @approver = User.find_by(email: step_params["approver"])
    @step.approver = User.find_by(email: step_params["approver"])
    @approval_flow = ApprovalFlow.find(params[:approval_flow_id])
    @step.approval_flow = @approval_flow
    if @step.save
      redirect_to approval_flow_path(@approval_flow)
    end
  end

  def approve
    @step = Step.find(params[:step_id])
    @step.status = "approved"
    @step.save # order of flow.steps changes and next one logic doesn't work, need to add order
    # if new_step exists change status to in review, if it does not, activate the final approval button
    @flow = @step.approval_flow
    @flow.steps.each_with_index do |step, index|
      if step == @step
        if @flow.steps[index + 1]
          @flow.steps[index + 1].status = "in review"
          @flow.steps[index + 1].save
        else
          # activate final approval button
        end
      end
    end
  end

  def reject
    @step = Step.find(params[:step_id])
    @step.status = "rejected"
    @step.save
    @step.approval_flow.proposal.status = "rejected"
    @step.approval_flow.proposal.save
  end

  def request_change
    @step = Step.find(params[:step_id])
    @step.status = "change request"
    @step.save
    # send notification to initiator
  end

  private

  def step_params
    params.require(:step).permit(:approver)
  end
end
