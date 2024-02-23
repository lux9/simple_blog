import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-comment"
export default class extends Controller {
  static targets = ["post", "form", "button", "comments", "errorBox", "commentsCount", "emptyCommentBox"]
  connect() {
  }

  submit(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        if (data == "Error saving comment") {
          this.errorBoxTarget.textContent = data;
          this.errorBoxTarget.classList.remove('d-none');
        } else {
          this.formTarget.reset();
          this.errorBoxTarget.textContent = "";
          this.errorBoxTarget.classList.add('d-none');
          this.formTarget.classList.add('d-none');
          this.buttonTarget.classList.remove('d-none');
          let newComment = document.createElement("li");
          newComment.innerHTML = data;
          this.commentsTarget.insertBefore(newComment, this.commentsTarget.firstChild);
          this.emptyCommentBoxTarget.innerHTML = ""
          this.commentsCountTarget.innerHTML = parseInt(this.commentsCountTarget.innerHTML, 10) + 1
        }
      })
  }
}