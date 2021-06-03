module ApplicationHelper
  def qrcode(text, options = {})
    ::RQRCode::QRCode.new(text, options).as_svg.html_safe
  end
end
