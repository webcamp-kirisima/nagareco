class LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    @label.save
  end

  private
  def label_params
    params.require(:label).permit(:label)
  end
end
