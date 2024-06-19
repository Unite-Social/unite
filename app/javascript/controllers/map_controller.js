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
      const popup = new mapboxgl.Popup({ closeOnClick: false, maxWidth: '600px', maxHeight: '200px' }).setHTML(a_marker.info_window_html)
      const marker = new mapboxgl.Marker()
        .setLngLat([ a_marker.lng, a_marker.lat ])
        .addTo(this.map)

      // Remover pop-up existente, se houver


      // Configurar novo pop-up
      marker.setPopup(popup)

      // Registrar evento de clique no marcador
      marker.getElement().addEventListener('click', () => {
        this.#centerPopup(a_marker)
      })

      // Toggle do pop-up se estiver aberto por padrão
      if (a_marker.info_window_open) { marker.togglePopup() }
    })
  }

  #centerPopup(markerData) { // Função adicionada
    this.map.flyTo({
      center: [markerData.lng, markerData.lat],
      zoom: 15,
      essential: true
    })

    // Esperar até que a animação de flyTo seja concluída
    this.map.once('moveend', () => {


      // Ajustar o mapa para que o popup fique visível
      const popupHeight = popup._content.offsetHeight
      const offset = popupHeight / 2 / Math.pow(2, this.map.getZoom())
      this.map.panBy([0, -offset], { duration: 500 })
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 190, maxZoom: 10, duration: 0 })
  }
}
