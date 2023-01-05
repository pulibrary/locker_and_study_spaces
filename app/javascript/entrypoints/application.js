import "lux-design-system/dist/system/system.css"
import "lux-design-system/dist/system/tokens/tokens.scss"
import Vue from "vue/dist/vue.esm"
import system from "lux-design-system"

Vue.use(system)

// create the LUX app and mount it to wrappers with class="lux"
//document.addEventListener("DOMContentLoaded", () => {
document.onreadystatechange = () => {
  if (document.readyState == "complete") {
    var elements = document.getElementsByClassName("lux")
    for (var i = 0; i < elements.length; i++) {
      new Vue({
        el: elements[i],
      })
    }  
  }
}
