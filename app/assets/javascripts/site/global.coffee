parsleyTooltipOptions =
  # Sets success and error class to Bootstrap class names
  successClass: "has-success"
  errorClass: "has-error"
  # Bootsrap needs success/error class to be set on parent element
  errors:
    classHandler: (el) ->
      # el.parent()
      $el.closest(".form-group")
    # Set these to empty to make sure the default Parsley elements are not rendered
    errorsWrapper: ""
    errorElem: ""
  listeners:
    # Show a tooltip when a validation error occurs
    onFieldError: (elem, constraints, parsleyField) ->
      console.log 'asdfoi'
      elem.tooltip
        animation: false
        container: "body"
        placement: "top"
        title: elem.data("error-message")
    # Hide validation tooltip if field is validated
    onFieldSuccess: (elem, constraints, parsleyField) ->
      elem.tooltip "destroy"

$ ->
  $('#form-quick-registration').parsley(parsleyTooltipOptions)