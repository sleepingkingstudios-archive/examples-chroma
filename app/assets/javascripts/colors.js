// app/assets/javascripts/colors.js

console.log('Loading app/assets/javascripts/colors.js...');

$(document).ready(function() {
  $body   = $('body');
  $form   = $('#pop_form');
  $cancel = $form.children('button');
  $submit = $form.children('input[type="submit"]');

  intervalId = null;

  convertIntToHexString = function(channel) {
    return channel < 16 ? '0' + channel.toString(16) : channel.toString(16)
  } // end function convertIntToHexString

  convertTupleToCssColor = function(tuple) {
    return '#' + convertIntToHexString(tuple[0]) + convertIntToHexString(tuple[1]) + convertIntToHexString(tuple[2])
  } // end function convertTupleToCssColor

  requestColor = function() {
    xhr = $.ajax({
      type: "DELETE",
      url:  $form.attr('action')
    }); // end ajax request

    xhr.fail(requestFailureHandler);
    xhr.done(requestSuccessHandler);
  } // end function requestColor

  requestFailureHandler = function() {
    console.log('requestFailureHandler()');
    console.log(arguments);
  } // end function requestFailureHandler

  requestSuccessHandler = function(tuple, status, request) {
    color = convertTupleToCssColor(tuple);
    console.log('requestSuccessHandler(), tuple = ' + tuple + ', color = ' + color);

    $body.css('background', color);
  } // end function requestSuccessHandler

  $cancel.click(function(event) {
    event.preventDefault();

    if(intervalId == null) { return; }

    clearInterval(intervalId);
    intervalId = null;
  }); // end click

  $submit.click(function(event) {
    event.preventDefault();

    console.log(intervalId);
    if(intervalId != null) { return; }

    // Request the first color.
    requestColor();

    // Request additional colors once per three seconds.
    intervalId = setInterval(requestColor, 3000);
  }); // end click
}); // end ready
