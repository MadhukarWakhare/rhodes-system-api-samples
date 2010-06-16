require 'rho/rhocontroller'

class BarcodeController < Rho::RhoController
  @layout = :simplelayout
  
  def index
    @result = ""
    render
  end

  def scan_image
    puts @params['file_name']
    Barcode.scan_image(url_for(:action => :scan_image_callback), @params['file_name'], 0)
  end

  def scan_image_callback
    result = @params['result']
    puts "scan_image_callback result: '#{result}"
    @result = result
    render :action => :index
  end

end
