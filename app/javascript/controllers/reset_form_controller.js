import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  reset() {
    this.element.reset();
    const audio_tag = document.getElementById('audio-tag');
    audio_tag.play();
  }
}