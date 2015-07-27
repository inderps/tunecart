class ClostelSignupController < ApplicationController
  protect_from_forgery with: :null_session

  def visited
    if params[:ip]
      entry = ClostelSignup.where(ip_address: params[:ip]).first_or_create
      entry.visited_count = entry.visited_count + 1
      unless entry.version
        entry.version = '1'
      end
      entry.save
    end
    render text: '', type: 'image/gif'
  end


  def signup
    if params[:ip]
      entry = ClostelSignup.where(ip_address: params[:ip]).first_or_create
      entry.entered_email = params[:entered_email]
      entry.hostel_name = params[:hostel_name]
      entry.city = params[:city]
      entry.current_app = params[:current_app]
      entry.query = params[:query]
      entry.save
    end
    redirect_to "http://clostel.com?message=thankyou"
  end
end
