import { Controller } from '@hotwired/stimulus'

export default class extends Controller {



  greet(event) {
    event.preventDefault()
    const href = event.currentTarget.dataset['href']
    window.location.href = href
    }


}
