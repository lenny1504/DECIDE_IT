class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @proposal = Proposal.find(params[:proposal_id])
    @step = Step.find(params[:step_id])
    @comment.step = @step
    @comment.user = current_user
    if @comment.save
      redirect_to proposal_path(@proposal), notice: "Comment created"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
