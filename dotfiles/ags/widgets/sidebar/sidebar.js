import Fetch from './fetch/fetch.js';
import Wallpapers from './wallpapers/wallpapers.js';
import { rev_sidebar, sidebar_shown } from '../shared/vars.js';

const Container = () => {
  const main = Widget.Stack({
    transition: 'slide_left',
    transition_duration: 500,
    shown: sidebar_shown.bind(),
    children: {
      fetch: Fetch(),
      wallpapers: Wallpapers(),
    },
  });

  return main;
}

const SideBar = (monitor = 0) => {
  return Widget.Window({
    name: 'sidebar',
    class_name: 'sidebar_window',
    monitor,
    anchor: ['left', 'top', 'bottom'],
    margins: [2, 0, 2, 0],
    child: Widget.Box({
      css: 'padding: 1px',
      child: Widget.Revealer({
        transition: 'slide_right',
        transition_duration: 400,
        child: Container(),
      }),
    }),
    setup: (self) => self.hook(rev_sidebar, () => {
      if (rev_sidebar.value) {
        App.openWindow('sidebar');
        self.child.child.reveal_child = true;

      } else {
        Utils.timeout(500, () => {
          App.closeWindow('sidebar');
        });
        self.child.child.reveal_child = false;
      }
    }),
  });
}

export default SideBar;
