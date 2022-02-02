import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "../stylesheets/application.scss";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
