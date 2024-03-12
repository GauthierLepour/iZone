import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    searchMarker: Array,
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12"
    })
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }

  #addMarkersToMap() {

    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker2 = document.createElement("div")
      customMarker2.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker2)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })

    if (this.searchMarkerValue.length > 0) {
      this.searchMarkerValue.forEach((marker) => {
        const customMarker = document.createElement("div")
        customMarker.innerHTML = marker.marker_html
        new mapboxgl.Marker(customMarker)
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(this.map)
      })
    }
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    if (this.searchMarkerValue.length > 0) {
      this.searchMarkerValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    }
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
