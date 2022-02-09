import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "../stylesheets/application.scss";
import "channels";
import "@fortawesome/fontawesome-free/css/all";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
