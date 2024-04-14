import StatusLine from './widgets/statusline/statusline.js';
import SideBar from './widgets/sidebar/sidebar.js';
import { AppLauncherMenu } from './widgets/statusline/modes/app_launcher.js';
import Notifications from './widgets/notifications/notification_popups.js';

App.resetCss();

const scss = `${App.configDir}/styles/main.scss`;
const css = `${App.configDir}/style.css`;
Utils.exec(`sassc ${scss} ${css}`);

App.applyCss(css);

App.config({
  windows: () => [
    StatusLine(),
    SideBar(),
    Notifications(),
  ],
});

