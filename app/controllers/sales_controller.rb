class SalesController < ApplicationController
  
  # after_action :write_file
  
  def show
    @sale = Sale.find(params[:id])
  end


  # protected

  # def write_file
  #   File.open('public/test.html', 'w+') do |f|
  #     f.write response.body
  #   end
  # end

end