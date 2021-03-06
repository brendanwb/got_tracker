/* eslint no-console:0 */
import { Application } from 'stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';
import Turbolinks from "turbolinks";
import Rails from "rails-ujs";
import "../css/application.css"

const application = Application.start();
const context  = require.context("./controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

Rails.start();
Turbolinks.start();

document.addEventListener("turbolinks:load", function() {
  console.log('It works on each visit!');
});
