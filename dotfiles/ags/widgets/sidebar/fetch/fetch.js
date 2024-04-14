import { sidebar_shown, rev_sidebar } from '../../shared/vars.js';
import { startPollAll, stopPollAll } from './modules/vars.js';
import fetch from './modules/fetch.js';
import stats from './modules/stats.js';
import desktop_controls from './modules/desktop_controls.js';
import notifications from './modules/notifications.js';
import createTree from './tree.js';

const Fetch = () => {
  const header = Widget.Label({
    class_name: 'header',
    label: 'File Explorer',
  });

  const path = Widget.Label({
    class_name: 'path',
    label: '~/dotfiles/ags/widgets/sidebar/',
    xalign: 0,
  });

  const tree = Widget.Box({
    class_name: 'tree',
    vertical: true,
    children: createTree({
      info: {
        type: 'dir',
        children: {
          fetch,
          stats,
        },
      },
      desktop: {
        type: 'dir',
        children: {
          desktop_controls,
          notifications,
        },
      },
    }),
  });

  const state = Utils.derive(
    [ rev_sidebar, sidebar_shown ],
    (a, b) => {
      return (rev_sidebar.value && (sidebar_shown.value === 'fetch'));
    },
  );

  const main = Widget.Box({
    class_name: 'fetch_bar',
    vertical: true,
    children: [
      header,
      path,
      tree,
    ],
    setup: (self) => self.hook(state, () => {
      if (state.value) {
        startPollAll();
      } else {
        stopPollAll();
      }
    }),
  });

  return main;
}

export default Fetch;
