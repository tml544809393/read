window.onload = choosePic;
function choosePic() {
    var myPix = new Array("img/service1.jpg","img/service2.jpg","img/follow.jpg");
    var randomNum = Math.floor((Math.random() * myPix.length));
    document.getElementById("myPicture").src = myPix[randomNum];
}