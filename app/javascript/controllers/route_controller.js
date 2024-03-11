import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    rideMarker: Array,
    eventMarker: Array,
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12"
    })
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.#addRouteToMap();
  }

  #addMarkersToMap() {

    this.rideMarkerValue.forEach((marker) => {
      const customMarker2 = document.createElement("div")
      customMarker2.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker2)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })

    this.eventMarkerValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.rideMarkerValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.eventMarkerValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addRouteToMap () {
    const url = `https://api.mapbox.com/directions/v5/mapbox/driving/${this.eventMarkerValue[0]["lng"]},${this.eventMarkerValue[0]["lat"]};${this.rideMarkerValue[0]["lng"]},${this.rideMarkerValue[0]["lat"]}?steps=true&geometries=geojson&access_token=${this.apiKeyValue}`
    fetch(url)
    .then(response => response.json())
    .then((data) => {
      const route = data.routes[0].geometry.coordinates;
      const geojson = {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'LineString',
          coordinates: route
        }
      };
      // if the route already exists on the map, we'll reset it using setData
      if (this.map.getSource('route')) {
        this.map.getSource('route').setData(geojson);
      }
      // otherwise, we'll make a new request
      else {

        this.map.addLayer({
          id: 'route',
          type: 'line',
          source: {
            type: 'geojson',
            data: geojson
          },
          layout: {
            'line-join': 'round',
            'line-cap': 'round'
          },
          paint: {
            'line-color': '#5356FF',
            'line-width': 5,
            'line-opacity': 0.75
          }
        });
      }})
  }
}
