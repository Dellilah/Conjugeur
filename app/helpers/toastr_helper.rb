module ToastrHelper
  def custom_flash_toastr
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def show_errors(errors)
    toastr = []
    errors.each do |error|
      text = "<script>toastr.error('#{error}');</script>"
      toastr << text.html_safe
    end
    toastr.join("\n").html_safe
  end
end
