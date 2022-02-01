import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "../stylesheets/application";
import "channels";

import "bootstrap";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
