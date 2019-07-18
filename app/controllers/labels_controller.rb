class LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    @label.save
    redirect_to :back
  end

  private
  def label_params
    params.require(:label).permit(:label)
  end
end
