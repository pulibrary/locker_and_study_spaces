import Vue from "vue/dist/vue.esm";
import system from "lux-design-system";
import "lux-design-system/dist/system/system.css";
import "lux-design-system/dist/system/tokens/tokens.scss";
// eslint-disable-next-line no-unused-vars
import Rails from "@rails/ujs"; // we need to import Rails so vite adds it to the module

Vue.use(system);

// create the LUX app and mount it to wrappers with class="lux"
document.addEventListener("DOMContentLoaded", () => {
  document.getElementsByTagName("html")[0].classList.remove("loading");
  var elements = document.getElementsByClassName("lux");
  for (var i = 0; i < elements.length; i++) {
    new Vue({
      el: elements[i],
    });
  }
});
