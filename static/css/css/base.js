var w;
var previous_m = 1;

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

// Getting the Class-name string
function ClassMark(x,n){
        if (x === null){return null}
        if (n > 0){
        return x.className.split(' ').slice(0,n).join(' ');
        } else {
            return x.className;
        }
    }

// Open-close function
function OpenClose(x){
    if (x.className.indexOf("w3-show") == -1) {
x.className += " w3-show";    
} else {
x.className = x.className.replace(" w3-show", "");
} 
}

// Closing submenu when clicking on the submenu link
function subLink(m) {
    var userSub = document.getElementById(m.id);
    userSub.className = userSub.className.replace(" w3-show", "");
}

// Gorizontal and LeftSide bar menu function
function myUser(m) {
var user = document.getElementById('m'+m); 
var userSub = document.getElementById('s'+m);
var w_bar = document.getElementById("barMenu").clientWidth;
var w = document.getElementById("myNavbar").clientWidth;
var dropDown = document.getElementsByClassName(ClassMark(userSub,3));
var menuLoop1 = document.getElementsByClassName(ClassMark(user,3));
var userChildAttr = user.childNodes[0].getAttribute('data-attr');
var userSub_prev = document.getElementById('s'+previous_m );
var prev = ClassMark(document.getElementById('m'+previous_m).childNodes[0],0); 
    
var i;
for (i = 0; i < menuLoop1.length; i++) {
    if (prev === user.childNodes[0].className) { continue; } 
     menuLoop1[i].childNodes[0].className = ClassMark(user.childNodes[0],0); 
}
    
    if (m !== previous_m && userSub_prev !== null){
       userSub_prev.className = userSub_prev.className.replace(" w3-show", "");
    }
    
    var i;
    for (i = 0; i < dropDown.length; i++) {
      if (userSub !== null && dropDown[i].id === userSub.id) { continue; } 
      dropDown[i].className = ClassMark(user.childNodes[0],0); 
    }
    
    user.childNodes[0].className = userChildAttr; 
    window.previous_m = m;
    
     if (userSub === null){ return; }
// Opening-closing the userSubMenu
OpenClose(userSub);
     if (w_bar === 0){ return; }
var userWidth = parseInt(userSub.style.width, 10);
// Aligning userSubMenu from the top
if(user.offsetTop === 0) {
userSub.style.marginTop = user.offsetTop+user.offsetHeight+2+'px';
}
else {
userSub.style.marginTop = user.offsetTop+2+'px';
}

// Aligning userSubMenu from the left
if(user.offsetLeft+userWidth > w){
userSub.style.marginLeft = w_bar-userWidth-2+'px';
}
else{
userSub.style.marginLeft = (user.offsetLeft-(w-w_bar))+'px';
}
userSub.style.position = 'absolute';
userSub.style.zIndex = 2;
userSub.style.backgroundColor = 'white';
}
    
    
// Footer menu function
function myFooter(m) {
var user = document.getElementById('mmm'+m);
var userSub = document.getElementById('sss'+m);

// Opening-closing the userSubMenu
OpenClose(userSub);
}

function subFootLink(m) {
    document.getElementById(m.id).className = "w3-hide";
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
    document.getElementById("im"+im).style.display = "block";
    var href = '#im'+im;
    window.location=href;
}


// resize computation block
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
    window.w = window.innerWidth;
        
// Menu text resizing when window width is 601 or 993px
var l = document.getElementsByClassName("loop1");
// Text size of top gorizontal menu
var sz = [15, 13, 11]; // size
var mr = [16, 0, 0]; // margin-bottom
var un = ['undefined', 'undefined', 'undefined'];
var undef = 'undefined';
var nl = [0, 0, 0];
sizeCount(w, l, sz, undef, un, undef, un);
              
// Top, left sentense on slider module
var x = document.getElementsByClassName("loop3");
        var sz = [32, 24, 14]; 
        var cl = 'blue'; // color-unused
        var tp = [2, 2, 2]; //margin-top
        var lf = 10; // margin-left
        sizeCount(w, x, sz, undef, tp, lf, un);
        
// Bottom, left sentense on slider module
var z = document.getElementsByClassName("loop4");   
        var sz = [16, 14, 7];
        var cl = 'green';  // unused
        var tp = [55, 50, 40]; 
        var lf = 5;       
         sizeCount(w, z, sz, undef, tp, lf, un);
        
// Slider module management section (arrows, circlles)
var v = document.getElementsByClassName("loop5"); 
         sizeCount(w, v, un, undef, un, undef, mr);
    
// Text resizing for characteristic module
    var sz1 = [24, 20, 17];
    var sz2 = [20, 16, 14];
    var sz3 = [18, 15, 13];
    var sz4 = [16, 14, 12];
    var sz5 = [13, 11, 9];
// Title size
var n1 = document.getElementsByClassName("loop8"); 
         sizeCount(w, n1, sz1, undef, un, undef, nl);
// Subtitle size
var n2 = document.getElementsByClassName("loop9"); 
         sizeCount(w, n2, sz2, undef, un, undef, nl);
// Sentence size
var n3 = document.getElementsByClassName("loop10"); 
         sizeCount(w, n3, sz3, undef, un, undef, nl);
// Description size
var n4 = document.getElementsByClassName("loop11"); 
         sizeCount(w, n4, sz4, undef, un, undef, nl);
// Footer menu text
var n5 = document.getElementsByClassName("loop12"); 
         sizeCount(w, n5, sz5, undef, un, undef, nl);
    
        
// Image vertical aligning for characteristic module
var p = document.getElementsByClassName("loop6");
var r = document.getElementsByClassName("loop7");
for (i = 0; i < r.length; i++) {
if (w < 601){
p[i].style.marginTop = '5px';
}
else{
    var dif = (r[i].offsetHeight - p[i].offsetHeight)/2.0;
    p[i].style.marginTop = dif+'px';
    if (dif < 0){
        p[i].style.marginTop = '5px';
        }
}
}
    
//
var top_height = document.getElementById("myNavbar").offsetHeight; 
    var headerShow = document.getElementById('headerShow');
    if (headerShow !== null) {
    headerShow.style.marginTop = top_height+15+'px'; 
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
      var attr_color = data4[i].getAttribute('data-data4');
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
    if (s === false){ t = 700; }
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