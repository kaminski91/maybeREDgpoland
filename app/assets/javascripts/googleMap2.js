/*
ponowna inicjalizacja googleMaps:
 wywołanie funkcji changeMapPinToView()
    bez parametrów ładuje wszystkie markery na mapę
 wywołanie funkcji changeMapPinToView(param1, param2, param3)
    ładuje przefiltrowane parametry markerów na mapę gdzie:
    param1 = państwo
    param2 = miasto
    param3 = brand
    w przypadku zadeklarowania parametru "null", bierze wszystkie

  przykład:
    changeMapPinToView(null, null, 'Furla') - pokaże na mapie wszystkie markery należące do brandu "Furla"
    changeMapPinToView(null, 'POZNAŃ') - pokaże na mapie wszystkie markery należące do miasta 'POZNAŃ'


----------------------------------------------------------------
    tablice przygotowane pod selecty
    funckja createArrayOf() dołączona do (document).ready
    ładuje wartościami trzy oddziele tablice = listOfCountry, listOfCity, listOfBrand
    tak więc przy dodaniu nowego rekordu do mapPins[] nie musimy się martwić o selecty

 */
var listOfCountry = ["WSZYSTKIE"];
var listOfCity = ["WSZYSTKIE"];
var listOfBrand = ["WSZYSTKIE"];
var mapPinToView = [];

var selectedCountry = null;
var selectedCity = null;
var selectedBrand = null;


$(document).ready(function() {
    mapPinToView = mapPins;
    createArrayOf();
    //createHtmlSelect();

    google.maps.event.addDomListener(window, 'load', initialize);

    for (item in listOfCountry){
        $('<option value="'+listOfCountry[item]+'">'+listOfCountry[item]+'</option>').appendTo('#listOfCountrySelect');
    }
    for (item in listOfCity){
        $('<option value="'+listOfCity[item]+'">'+listOfCity[item]+'</option>').appendTo('#listOfCitySelect');
    }
    for (item in listOfBrand){
        $('<option value="'+listOfBrand[item]+'">'+listOfBrand[item]+'</option>').appendTo('#listOfBrandSelect');
    }


});


function countrySelectChangeFunc() {
    var selectBox = document.getElementById("listOfCountrySelect");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    console.log(selectedValue);
    selectedCountry = selectedValue == "WSZYSTKIE" ? null :selectedValue;
    changeMapPinToView(selectedCountry, selectedCity, selectedBrand)
}
function citySelectChangeFunc() {
    var selectBox = document.getElementById("listOfCitySelect");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    console.log(selectedValue);
    selectedCity = selectedValue == "WSZYSTKIE" ? null :selectedValue;
    changeMapPinToView(selectedCountry, selectedCity, selectedBrand)
}
function brandSelectChangeFunc() {
    var selectBox = document.getElementById("listOfBrandSelect");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    console.log(selectedValue);
    selectedBrand = selectedValue == "WSZYSTKIE" ? null :selectedValue;
    changeMapPinToView(selectedCountry, selectedCity, selectedBrand)
}


function changeMapPinToView(country, city, brand){
    mapPinToView = mapPins;
    if(country || city || brand){
        if(country){
            mapPinToView = _.filter(mapPinToView, function(singleObject){
                return singleObject.country == country
            });
        }
        if(city){
            mapPinToView = _.filter(mapPinToView, function(singleObject){
                return singleObject.city == city
            });
        }
        if(brand){
            mapPinToView = _.filter(mapPinToView, function(singleObject){
                return singleObject.brand == brand
            });
        }
    }
    initialize();
}

function initialize() {
    var mapCanvas = document.getElementById('map-canvas');
    var mapOptions = {
        center: new google.maps.LatLng(52.203589,21.033085),
        zoom:6,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel: false
    };
    var map = new google.maps.Map(mapCanvas, mapOptions);

    for(var i = 0; i < mapPinToView.length ; i++){
        var position = null;
        position = new google.maps.LatLng(mapPinToView[i].positionX, mapPinToView[i].positionY);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: mapPinToView[i].brand,
            animation: google.maps.Animation.DROP
        });

    }
}

function createArrayOf(){ // funkcja tworząca tablice listOfCity, listOfCountry, listOfBrand
    _.each(mapPins, function(singlePinObject){

        if(listOfCity.length == 0){
            listOfCity.push(singlePinObject.city);
        }else {
            if (!_.contains(listOfCity, singlePinObject.city))
                listOfCity.push(singlePinObject.city);
        }

        if(listOfCountry.length == 0){
            listOfCountry.push(singlePinObject.country);
        }else {
            if(!_.contains(listOfCountry, singlePinObject.country))
                listOfCountry.push(singlePinObject.country);
        }

        if(listOfBrand.length == 0){
            listOfBrand.push(singlePinObject.brand);
        }else {
            if(!_.contains(listOfBrand, singlePinObject.brand))
                listOfBrand.push(singlePinObject.brand);
        }

    });
}
