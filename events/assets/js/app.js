// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"
import flatpickr from 'flatpickr';
flatpickr('.flatpickr.js-flatpickr-dateTime', {
  enableTime: true,
  time_24hr: true,
  altInput: true,
  altFormat: 'd M Y H:i',
  dateFormat: 'd-m-Y H:i'
})
// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
