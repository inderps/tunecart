class CouponsController < ApplicationController
  def download
    coupon = Coupon.find_by_code(params[:coupon_code])
    if coupon
      if coupon.used
        resp_message = {message: 'This coupon code is already used'}
        code = 404
      else
        coupon.used = true
        coupon.save
        album = S3_BUCKET.objects['Reality_is_the_new_fantasy.zip']
        resp_message = {url: album.url_for(:get, { :expires => 20.minutes.from_now, :secure => true }).to_s}
        code = 200
      end
    else
      resp_message = {message: 'Invalid coupon code'}
      code = 404
    end
    render json: resp_message, status: code
  end
end
