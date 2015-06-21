function changeMapPinToView(i,n,t){mapPinToView=mapPins,i&&(mapPinToView=_.filter(mapPinToView,function(n){return n.country==i})),n&&(mapPinToView=_.filter(mapPinToView,function(i){return i.city==n})),t&&(mapPinToView=_.filter(mapPinToView,function(i){return i.brand==t})),printResults(),initialize()}function printResults(){$("#salon-list").html("");for(i in mapPinToView)$("#salon-list").append('<div class="row"><div class="2u">'+mapPinToView[i].brand+'</div><div class="2u">'+mapPinToView[i].address+'</div><div class="2u">'+mapPinToView[i].city+'</div><div class="6u">'+mapPinToView[i].description+"</div></div>")}function initialize(){for(var i=document.getElementById("map-canvas"),n={center:new google.maps.LatLng(52.203589,21.033085),zoom:6,mapTypeId:google.maps.MapTypeId.ROADMAP,scrollwheel:!1},t=new google.maps.Map(i,n),a=0;a<mapPinToView.length;a++){var e=null;e=new google.maps.LatLng(mapPinToView[a].positionX,mapPinToView[a].positionY),marker=new google.maps.Marker({position:e,map:t,title:mapPinToView[a].brand,animation:google.maps.Animation.DROP})}}function createArrayOf(){_.each(mapPins,function(i){0==listOfCity.length?listOfCity.push(i.city):_.contains(listOfCity,i.city)||listOfCity.push(i.city),0==listOfCountry.length?listOfCountry.push(i.country):_.contains(listOfCountry,i.country)||listOfCountry.push(i.country),0==listOfBrand.length?listOfBrand.push(i.brand):_.contains(listOfBrand,i.brand)||listOfBrand.push(i.brand)})}function appendSelect(){var n=$("#country");for(i in listOfCountry.sort())n.append('<option value="'+listOfCountry[i]+'"> '+listOfCountry[i].capitalizeFirstLetter());var t=$("#city");for(i in listOfCity.sort())t.append('<option value="'+listOfCity[i]+'"> '+listOfCity[i].capitalizeFirstLetter());var a=$("#brand");for(i in listOfBrand.sort())a.append('<option value="'+listOfBrand[i]+'"> '+listOfBrand[i].capitalizeFirstLetter())}var listOfCountry=[],listOfCity=[],listOfBrand=[],mapPinToView=[];$(document).ready(function(){mapPinToView=mapPins,createArrayOf(),appendSelect(),$(".map-filter select").on("change",function(){var i="null"==$("#country").val()?null:$("#country").val(),n="null"==$("#city").val()?null:$("#city").val(),t="null"==$("#brand").val()?null:$("#brand").val();changeMapPinToView(i,n,t)}),google.maps.event.addDomListener(window,"load",initialize)}),String.prototype.capitalizeFirstLetter=function(){return this.charAt(0).toUpperCase()+this.slice(1).toLowerCase()};