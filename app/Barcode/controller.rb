require 'rho/rhocontroller'

class BarcodeController < Rho::RhoController
  @layout = :simplelayout
  
  def index
    puts "index"
    @message = "Test"
    render
  end

  def scan_image
    puts "scan_image #@params['file_name']"
    Barcode.scan_image(url_for(:action => :scan_image_callback), @params['file_name'], 0)
  end

  def scan_image_callback
    result = @params['result']
    puts "scan_image_callback result: #{result}"
    @message = result
    render :action => :index
    WebView.navigate( url_for :action => :index )
  end

  def scan_from_camera 
    Camera::take_picture(url_for :action => :camera_callback)
  end

  def camera_callback
    puts "camera_callback #@params['image_uri']"
    if @params['status'] == 'ok'
      #scan_image @params['image_uri']
    end
  end

end
