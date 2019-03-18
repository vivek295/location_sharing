var renderMap = function(){
  $('div[data-id]').each(function() {
    var longitude = $(this).data('longitude');
    var lattitude = $(this).data('lattitude');
    var id = $(this).data('id');
    var target = `map_${id}`;
    var pos = ol.proj.fromLonLat([longitude,lattitude]);
    var map = new ol.Map({
      target: target,
      layers: [
        new ol.layer.Tile({
          source: new ol.source.OSM()
        })
      ],
      view: new ol.View({
        center: pos,
        zoom: 5
      })
    });

    var marker = new ol.Overlay({
      position: pos,
      positioning: 'center-center',
      element: document.getElementById('marker_'+id),
      stopEvent: false
    });
    map.addOverlay(marker);

    var locationName = new ol.Overlay({
      position: pos,
      element: document.getElementById('locationName_'+id)
    });
    map.addOverlay(locationName);
  });
}

var mapView = function () {
  if ($('#map').length > 0) {
    var map = new ol.Map({
      target: 'map',
      layers: [
        new ol.layer.Tile({
          source: new ol.source.OSM()
        })
      ],
      view: new ol.View({
        center: ol.proj.fromLonLat([88.32,22.67]),
        zoom: 5
      })
    });

    var view = new ol.View({
      center: [0, 0],
      zoom: 2
    });

    var geolocation = new ol.Geolocation({
      trackingOptions: {
        enableHighAccuracy: true
      },
      projection: view.getProjection(),
      tracking: true,
    });
    var popup = new ol.Overlay({
      element: document.getElementById('popup')
    });
    map.addOverlay(popup);
    map.on('click', function(evt) {
      var element = popup.getElement();
      var coordinate = evt.coordinate;
      var hdms = ol.coordinate.toStringHDMS(ol.proj.toLonLat(coordinate));

      $(element).popover('dispose');
      var longLat = ol.proj.toLonLat(coordinate);
      $('#longitude').val(longLat[0]);
      $('#lattitude').val(longLat[1]);
      popup.setPosition(coordinate);
      $(element).popover({
        placement: 'top',
        animation: false,
        html: true,
        content: '<p>Share clicked location:</p><code>' + hdms + '</code>'
      });
      $(element).popover('show');
    });
  }
}
