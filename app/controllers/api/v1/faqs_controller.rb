class Api::V1::FaqsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update, :destroy]
  before_action :find_faq, only:[:show, :update, :destroy]

  def index
   @faqs = Faq.all
   render json: @faqs
  end





  private

  def faq_params
    params.require(:faq).permit( :id, :question, :answer)
  end

  def find_faq
    @faq = Faq.find_by_id(params[:id])
  end

end
