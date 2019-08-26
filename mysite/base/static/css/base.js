// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

// Toggle between showing and hiding the sidebar when clicking the menu icon
function w3_open(ident) {
    var sidebar = document.getElementById(ident);
     if (sidebar === null){ return; }
  if (sidebar.style.display === 'block') {
    sidebar.style.display = 'none';
  } else {
    sidebar.style.display = 'block';
  }
}

// Close the sidebar with the close button
function w3_close(ident) {
     var sidebar = document.getElementById(ident);
    if (sidebar === null){ return; }
    sidebar.style.display = "none";
}

// Gorizontal bar menu function
function myUser(m) {
var user = document.getElementById('m'+m);
var userSub = document.getElementById('s'+m);
var w_bar = document.getElementById("barMenu").clientWidth;
var w = document.getElementById("myNavbar").clientWidth;
var userWidth = parseInt(userSub.style.width, 10);

// Aligning userSubMenu from the top
if(user.offsetTop === 0) {
userSub.style.marginTop = user.offsetTop + user.offsetHeight + 2 + 'px';
}
else {
userSub.style.marginTop = user.offsetTop + 2 + 'px';
}

// Aligning userSubMenu from the left
if(user.offsetLeft+userWidth > w){
userSub.style.marginLeft = w_bar-userWidth-2 + 'px';
}
else{
userSub.style.marginLeft = (user.offsetLeft - (w - w_bar)) + 'px';
}

userSub.style.position = 'absolute';
userSub.style.zIndex = 2;

var dropDown = document.getElementsByClassName("w3-dropdown-content");
var menuLoop1 = document.getElementsByClassName("loop1");
var i;
for (i = 0; i < dropDown.length; i++) {
if (dropDown[i].id === userSub.id) { continue; }
dropDown[i].className = "w3-dropdown-content w3-bar-block w3-border w3-border-blue";
menuLoop1[i].style.color = 'black';
}

// Opening-closing the userSubMenu
if (userSub.className.indexOf("w3-show") == -1) {
userSub.className += " w3-show";
user.style.color = 'blue';
console.log('subMenu is open');
} else {
userSub.className = userSub.className.replace(" w3-show", "");
user.style.color = 'black';
console.log('subMenu is closed');
}
}

// Left SideMenu function
function mySide(m) {
var user = document.getElementById('mm'+m);
var userSub = document.getElementById('ss'+m);
var dropDown = document.getElementsByClassName("w3-hide");
var menuLoop1 = document.getElementsByClassName("loop2");
var i;
for (i = 0; i < dropDown.length; i++) {
if (dropDown[i].id === userSub.id) { continue; }
dropDown[i].className = "w3-hide w3-bar-block w3-border w3-border-blue";
menuLoop1[i].style.color = 'white';
}

// Opening-closing the SideMenu
if (userSub.className.indexOf("w3-show") == -1) {
userSub.className += " w3-show";
user.style.color = 'blue';
} else {
userSub.className = userSub.className.replace(" w3-show", "");
user.style.color = 'white';
}
}

// Put input fields with w3-class
var clas = document.getElementsByTagName('input'); 
var fa = document.getElementsByClassName('w3-xxlarge');
var fafa = ['fa fa-user', 'fa fa-envelope-o', 'fa fa-phone', 'fa fa-pencil'];
 for (i = 0; i < clas.length; i++) {
     if (fa[i] === 'undefined') { continue; }
     clas[i].className = 'w3-input w3-border w3-round';
 }
// Put i-class with fa-fa-icon
for (i = 0; i < fa.length; i++) {
    fa[i].className = "w3-xxlarge " + fafa[i];
}

// Slideshow characteristic Images
function charImage(im) {
var expandImg = document.getElementById("im"+im).style.display = "block";
}

//
function styleSet(l, sz, cl, tp, lf, mr){
    if (sz !== 'undefined'){
        l.style.fontSize = sz+'px'; // font-size
    }
    if (cl !== 'undefined'){
        l.style.color = cl;  // color
    }
    if (tp !== 'undefined'){
        l.style.top = tp+'%'; // margin-top for display
    }
    if (lf !== 'undefined'){
        l.style.left = lf+'%'; // margin-left for display
    }
     if (mr !== 'undefined'){
        l.style.marginBottom = mr+'px';// margin-bottom
    }
}

function sizeCount(w, l, sz, cl, tp, lf, mr){
    
    for (i = 0; i < l.length; i++) {
if (w > 993){
    styleSet(l[i], sz[0], cl, tp[0], lf, mr[0])
    continue;
}
if (w > 601){
    styleSet(l[i], sz[1], cl, tp[1], lf, mr[1])
    continue;
}
    else{
        styleSet(l[i], sz[2], cl, tp[2], lf, mr[2])
        continue;
    }
} 
}

// RESIZE FUNCTIONS
function resSize(){
    var w = window.innerWidth;
        
// Menu text resizing when window width is 601 or 993px
var l = document.getElementsByClassName("loop1");
// Text size of top gorizontal menu
var sz = [15, 12, 10];
var mr = [16, 0, 0];
var un = 'undefined';
sizeCount(w, l, sz, un, un, un, un);
              
// Top, left sentense on slider module
var x = document.getElementsByClassName("loop3");
        var sz = [32, 24, 14];
        var cl = 'blue'; // unused
        var tp = [2, 2, 2];
        var lf = 10;
        sizeCount(w, x, sz, un, tp, lf, un);
        
// Bottom, left sentense on slider module
var z = document.getElementsByClassName("loop4");   
        var sz = [16, 14, 7];
        var cl = 'green';  // unused
        var tp = [55, 50, 40];
        var lf = 5;       
         sizeCount(w, z, sz, un, tp, lf, un);
        
// Slider module management section (arrows, circlles)
var v = document.getElementsByClassName("loop5"); 
         sizeCount(w, v, un, un, un, un, mr);
    
// Text resizing for characteristic module
    var sz1 = [24, 20, 17];
    var sz2 = [20, 16, 14];
    var sz3 = [18, 15, 13];
    var sz4 = [16, 14, 12];
// Title size
var n1 = document.getElementsByClassName("loop8"); 
         sizeCount(w, n1, sz1, un, un, un, 0);
// Subtitle size
var n2 = document.getElementsByClassName("loop9"); 
         sizeCount(w, n2, sz2, un, un, un, 0);
// Sentence size
var n3 = document.getElementsByClassName("loop10"); 
         sizeCount(w, n3, sz3, un, un, un, 0);
// Description size
var n4 = document.getElementsByClassName("loop11"); 
         sizeCount(w, n4, sz4, un, un, un, 0);
    
        
// Image vertical aligning for characteristic module
var p = document.getElementsByClassName("loop6");
var r = document.getElementsByClassName("loop7");
for (i = 0; i < r.length; i++) {
if (w < 601){
p[i].style.marginTop = '5px';
}
else{
    var dif = (r[i].offsetHeight - p[i].offsetHeight)/2.0;
    p[i].style.marginTop = dif + 'px';
    if (dif < 0){
        p[i].style.marginTop = '5px';
        }
}
}
    
//
var top_height = document.getElementById("myNavbar").offsetHeight; 
    var headerShow = document.getElementById('headerShow');
    if (headerShow !== null) {
    headerShow.style.marginTop = top_height + 15 + 'px'; 
    }
}


// Slider show function
var slideIndex = 1;
showDivs(slideIndex);
function plusDivs(n) {
  showDivs(slideIndex += n);
}
function currentDiv(n) {
  showDivs(slideIndex = n);
}
function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var z = document.getElementsByClassName("myText");
  var data4 = document.getElementsByClassName("loop4");
  var dots = document.getElementsByClassName("demo");
    
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
    
    var arrow_right = document.getElementsByClassName("arrow-right");
    var arrow_left = document.getElementsByClassName("arrow-left");
    
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
    z[i].style.display = "none"; 
  } 
    
  for (i = 0; i < dots.length; i++) {
      attr_color = data4[i].getAttribute('data-data4');
     // dots[i].className = dots[i].className.replace(" w3-blue", "");
  
      dots[i].className = "demo w3-badge w3-border w3-border-blue w3-transparent w3-hover-yellow";
      
      arrow_right[i].style.display = 'none';
      arrow_right[i].style.color = attr_color;
      arrow_left[i].style.display = 'none';
      arrow_left[i].style.color = attr_color;
  }
  x[slideIndex-1].style.display = "block";  
  z[slideIndex-1].style.display = "block"; 
  // dots[slideIndex-1].className += " w3-blue";
    
    dots[slideIndex-1].className += " w3-"+data4[slideIndex-1].getAttribute('data-data4');
    
    arrow_right[slideIndex-1].style.display = 'block';
    arrow_left[slideIndex-1].style.display = 'block';
}

var myVar;
function myTimer() {
  plusDivs(1);
    if (s === false){
        clearInterval(myVar);
        s = true;
        SliderStart();
    }
} 

var s = false;
var t = 4000;
function SliderStart(){
    if (s === false){ t = 500; }
    else { t = 4000; }
    myVar = setInterval(myTimer, t);
}

function SliderStop(){
    clearInterval(myVar);
}

var el = document.getElementById("headerShow");
el.addEventListener("mouseover", SliderStop);
el.addEventListener("mouseout", function(){
    s = false;
    SliderStart();
});

SliderStart();

// RESIZE LISTENERS
window.addEventListener("resize", function(){
resSize();
});

document.addEventListener('readystatechange', event => {
  if (event.target.readyState === 'interactive') {
  }
  else if (event.target.readyState === 'complete') {
    resSize();
  }
});
