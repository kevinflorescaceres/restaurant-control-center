module ApplicationHelper
  def color_button_main(short_name)
    case short_name
    when 'Keu'
      'button-color-keu'
    when 'Aguacate'
      'button-color-aguacate'
    end
  end

  def status_color(status)
    case status
    when 'ok'
      'text-success'
    when 'warning'
      'text-warning'
    when 'error'
      'text-danger'
    end
  end
end
