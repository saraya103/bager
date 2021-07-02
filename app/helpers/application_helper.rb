module ApplicationHelper
  def qrcode(text, options = {})
    ::RQRCode::QRCode.new(text, options).as_svg(
      module_size: 6
    ).html_safe
  end
end
