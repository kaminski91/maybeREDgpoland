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
var listOfCountry = [];
var listOfCity = [];
var listOfBrand = [];
var mapPinToView = [];

$(document).ready(function() {
    mapPinToView = mapPins;
    createArrayOf();
    appendSelect();

    $('.map-filter select').on('change', function() {
        var country = ($('#country').val() == "null")? null : $('#country').val();
        var city = ($('#city').val() == "null")? null : $('#city').val();
        var brand = ($('#brand').val() == "null")? null : $('#brand').val();
        changeMapPinToView(country, city, brand)
    })

    google.maps.event.addDomListener(window, 'load', initialize);
});

function changeMapPinToView(country, city, brand){
    mapPinToView = mapPins;
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

    printResults();

    initialize();
}

function printResults() {
    $('#salon-list').html('');
    for(i in mapPinToView) {
        $('#salon-list').append('<div class="row"><div class="2u">' + mapPinToView[i].brand + '</div><div class="4u">' + mapPinToView[i].address + '</div><div class="6u">' + mapPinToView[i].description + '</div></div>');
    }
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

function appendSelect(){
    var countrySelect = $('#country');
    for(i in listOfCountry.sort()) {
        countrySelect.append('<option value="' + listOfCountry[i] + '"> ' + listOfCountry[i].capitalizeFirstLetter());
    }

    var citySelect = $('#city');
    for(i in listOfCity.sort()) {
        citySelect.append('<option value="' + listOfCity[i] + '"> ' + listOfCity[i].capitalizeFirstLetter());
    }

    var brandSelect = $('#brand');
    for(i in listOfBrand.sort()) {
        brandSelect.append('<option value="' + listOfBrand[i] + '"> ' + listOfBrand[i].capitalizeFirstLetter());
    }
//    var citySelect = document.getElementById('citySelect');
//    for(var i = 0; i < listOfCity.length; i++) {
//        var opt = document.createElement('option');
//        opt.innerHTML = listOfCity[i];
//        opt.value = listOfCity[i];
//        opt.onclick = function(){
//            selectedCitySelect = listOfCity[i];
//            console.log('selectedCitySelect = ' + selectedCitySelect)
//        };
//        citySelect.appendChild(opt);
//    }
}

String.prototype.capitalizeFirstLetter = function() {
    return this.charAt(0).toUpperCase() + this.slice(1).toLowerCase();
}