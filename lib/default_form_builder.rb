class DefaultFormBuilder < ActionView::Helpers::FormBuilder

  def render_errors
    errors = object.errors.full_messages
    @template.render(partial: 'shared/show_errors', locals: { errors: errors }) if errors.any?
  end
end
