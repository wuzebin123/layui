document.oncontextmenu = function() {
    return false;
};
document.onselectstart = function() {
    return false;
}; //document.οncοntextmenu=function(){return false;};document.onselectstart=function(){return false;};let h = window.innerHeight;let w = window.innerWidth;document.oncontextmenu = function () { return false; };window.onkeydown = window.onkeyup = window.onkeypress = function () {window.event.returnValue = false;return false;};document.onkeydown = function () {if (window.event && window.event.keyCode == 123) {event.keyCode = 0;event.returnValue = false;return false;}};window.onresize = function () {if (h != window.innerHeight || w != window.innerWidth) {window.close();window.location = "about:blank";}};
