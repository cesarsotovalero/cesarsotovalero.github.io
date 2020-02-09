// Initialize and add the map
function initMap() {
   var uluru = {lat: 59.346936, lng: 18.072549};
   var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 12, center: uluru});
   var marker = new google.maps.Marker({position: uluru, map: map});
}