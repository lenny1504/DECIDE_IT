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
    @original_status = @step.status
    @step.status = "approved"
    @step.save # order of flow.steps changes and next one logic doesn't work, need to add order
    # if new_step exists change status to in review, if it does not, activate the final approval button
    @flow = @step.approval_flow
    @ordered_steps = @flow.steps.order('created_at asc')
    @ordered_steps.each_with_index do |step, index|
      if step == @step
        if @ordered_steps[index + 1]
          @ordered_steps[index + 1].status = "in review"
          @ordered_steps[index + 1].save
        else
          # activate final approval button
        end
      end
    end
    create_log(@step, @original_status, @step.status)
  end

  def reject
    @step = Step.find(params[:step_id])
    @original_status = @step.status
    @step.status = "rejected"
    @step.save
    @step.approval_flow.proposal.status = "rejected"
    @step.approval_flow.proposal.save
    create_log(@step, @original_status, @step.status)
  end

  def request_change
    @step = Step.find(params[:step_id])
    @original_status = @step.status
    @step.status = "change request"
    @step.save
    # send notification to initiator
    create_log(@step, @original_status, @step.status)
  end

  def create_log(step, original_status, updated_status)
    Log.create(step: step, original_status: original_status, updated_status: updated_status )
  end

  private

  def step_params
    params.require(:step).permit(:approver)
  end
end
