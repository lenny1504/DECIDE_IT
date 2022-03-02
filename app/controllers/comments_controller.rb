class CommentsController < ApplicationController

# see all comments for one proposal »» Show View of Proposal = /proposals/:id
# show step on proposal show and enable posibility of commenting

  def index
    #@proposal = Proposal.find(params[:id]) not yet related!
    @approval_flow = ApprovalFlow.find()
    @comment = Comment.new
  end

  # Create a new comment (related to one step / approval flow / proposal !!??)
  # /steps/step_id/comments/new
  def new
    @comment = Comment.new
  end

  # /steps/step_id/comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @proposal.step = Step.find(params[:step_id])
    # @proposal.approval_flow.comment
    # @comment.proposal = Proposal.find(params[:proposal_id])
    if @comment.save
      redirect_to proposal_path(@proposal.id), notice: "Your comment has been posted"
    else
      render "comment/new"
    end
  end

  def change_request
    #should be able to change the status of a step to "change request"
    # writting "@change_request" (regex) ?
  end

  private

  def comments_params
    params.require(:comments).permit(:content)
  end

end
