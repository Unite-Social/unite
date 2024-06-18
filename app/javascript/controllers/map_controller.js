import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log(this.markersValue);
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/guilhermeronchi/clxknyaz501rd01qm25uu8uml"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((a_marker) => {
      const popup = new mapboxgl.Popup({ closeOnClick: false, maxWidth: '540px', maxHeight: '640px' }).setHTML(a_marker.info_window_html)
      const marker = new mapboxgl.Marker()
        .setLngLat([ a_marker.lng, a_marker.lat ])
        .setPopup(popup)
        .addTo(this.map)

      if (a_marker.info_window_open) { marker.togglePopup() };
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 190, maxZoom: 17.3, duration: 0 })
  }
}
