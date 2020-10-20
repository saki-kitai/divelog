// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs


document.addEventListener("turbolinks:load", function() {
    initMap()
});

//$(document).ready(() => {
//    initMap();
//});

function initMap() {
    // ロードした時のデータをここにいれる
    // (-28.882304674138656, 144.139703125)を「,」で正規表現で区切って、最初と最後のカッコもreplaceをする
    var myLatlng = { lat: -25.363, lng: 131.044 };

    //var map = new google.maps.Map(document.getElementById('map'), { zoom: 4, center: myLatlng });

    var elements = document.getElementsByClassName('map');

    for (let el of elements) {
        // var lat = el.dataset.lat;
        // var lng = el.dataset.lng;

        //var myLatlng = { lat: el.dataset.lat, lng: el.dataset.lng };

        var map = new google.maps.Map(el, {
            zoom: 2,
            center: myLatlng,
            zoomControl: false,
            streetViewControl: false
        });

        // Create the initial InfoWindow.
        var infoWindow = new google.maps.InfoWindow({ content: 'Click the map to get Lat/Lng!', position: myLatlng });

        infoWindow.open(map);

        // ここだけ触ること、それ以外触らない！！
        map.addListener('click', function(mapsMouseEvent) {
            // Close the current InfoWindow.
            infoWindow.close();
            console.log(mapsMouseEvent.latLng.toString());

            // ここにformのidをいれることでクリックしたときにデータがリアルタイムで適用される
            $('#log_Wind').val(mapsMouseEvent.latLng.toString());

            // Create a new InfoWindow.
            infoWindow = new google.maps.InfoWindow({ position: mapsMouseEvent.latLng });
            infoWindow.setContent(mapsMouseEvent.latLng.toString());
            infoWindow.open(map);
        });
    }
}
