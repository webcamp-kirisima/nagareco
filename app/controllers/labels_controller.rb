class LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    @label.save
    redirect_to  new_admin_product_path(current_user)
  end

  private
  def label_params
    params.require(:label).permit(:label)
  end
end
