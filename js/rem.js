function Rem() {
var rem = document.documentElement.clientWidth/6.4;
document.documentElement.style.fontSize = rem + 'px';
}
Rem();
window.onresize = function () {
Rem();
}
//10px = 1rem