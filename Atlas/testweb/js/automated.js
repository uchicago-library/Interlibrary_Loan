;(function () {
  $(document).ready(function() {
    var formData = $("form[name^='GenericRequest']").serialize() + "&SubmitButton=Submit%20Request";

    $.post("illiad.dll", formData).done(function(data) {
      var content = $(data).find('#status span');

      if (content.length === 0) {
        content = $("<span class='statusError'>Unexpected error encountered while submitting request.</span>");
      }

      content = content.append("<br><span class='statusInformation'>You may now close this window.</span>");

      $("#status").empty().append(content);
    });
  });
}());
