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


// Highlighting menu items
 $(document).ready(function(){
     var y = document.getElementById("catIdent").innerHTML;
     var y1 = document.getElementById("catIdent1").innerHTML;
     if(y === 'none' && y1 === 'none'){ return; }
     if (y !== 'all' && y1 !== 'all'){
        document.getElementById('all').style.color='black';
        document.getElementById('all1').style.color='black';
    }
        document.getElementById(y).style.color='red';
        document.getElementById(y1).style.color='red';
 });


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


// Slideshow characteristic Images
function charImage(im) {
var expandImg = document.getElementById("im"+im).style.display = "block";
}

// Window resize function
//var ratioFlag = 0;
function resSize(){
    var w = window.innerWidth;
    
    $(document).ready(function(){    
        
// Image aligning
var x = document.getElementsByClassName("w3-third");
        if (x.style === undefined){ return; }
var y = document.getElementsByClassName("w3-twothird");
        if (y.style === undefined){ return; }
for (i = 0; i < x.length; i++) {
if (w < 601){
x[i].style.marginTop = '10px';
}
else{
x[i].style.marginTop = (y[i].offsetHeight - x[i].offsetHeight)/2.0 + 'px';
}
}
    
var top_height = document.getElementById("myNavbar").offsetHeight; 
    
    var headerShow = document.getElementById('headerShow');
    if (headerShow !== null) {
    headerShow.style.marginTop = top_height + 20 + 'px'; 
    }
    
var sidebarwidth = document.getElementById('prod_list');
    if (sidebarwidth === null){ return; }
if (w < 601){
    sidebarwidth.style.marginLeft = '0px';
}
else{
    sidebarwidth.style.marginLeft = '250px';
}

var sideBar = document.getElementById('sideBar');
sideBar.style.top = top_height + 6 + 'px'; 
    });
    
}

resSize();

window.addEventListener("resize", function(){
resSize();
});


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
  //  if (x.style === undefined){ return; }
  var z = document.getElementsByClassName("myText");
  //  if (z.style === undefined){ return; }
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
    z[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  z[slideIndex-1].style.display = "block"; 
  dots[slideIndex-1].className += " w3-white";
}

function myTimer() {
  plusDivs(1);
} 

var myVar = setInterval(myTimer, 4000);

// Product detail card slider function
function currentProd(n) {
  showProd(slideIndex = n);
}

function showProd(n) {
  var i;
  var x = document.getElementsByClassName("ProdSlides");
  var dots = document.getElementsByClassName("demoProd");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
