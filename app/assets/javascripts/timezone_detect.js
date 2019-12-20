$(window).ready(function() {
  jQuery(function() {
    var tz = jstz.determine();
    Cookies.set('timezone', tz.name());

    if (Cookies.get('timezone_cookie_check') == "true" && Cookies.get('timezone') && Cookies.get('timezone').length > 0) {
      location.reload();
    }
  });
});