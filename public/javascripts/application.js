// The right way to add load events. By Simon Willison
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  }
  else {
    window.onload = function() {
      oldonload();
      func();
    }
  }
}