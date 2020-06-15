import Vue from 'vue/dist/vue.esm.js'
import Index from './components/index.vue'
import axios from 'axios'

var app = new Vue({
  el: '#app',
  components: {
    'contents' :Index
  }
});
