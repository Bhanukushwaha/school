//= require jquery3
//= require popper
//= require bootstrap-sprockets
import "@hotwired/turbo-rails"
import "jquery"

$(document).on("turbo:load", () => {
  console.log("turbo!");
});