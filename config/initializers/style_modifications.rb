# Override ActionView::Base.field_error_proc cos it's messing with field styling
# replace default of surrounding div tag with inserstion into class name
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag # disable replacement &/ wrapping entirely

  # class_attr_index = html_tag.index 'class="'
  #
  # if class_attr_index
  #   html_tag.insert class_attr_index+7, 'field_with_errors'
  # else
  #   html_tag.insert html_tag.index('>'), ' class="field_with_errors"'
  # end
end
