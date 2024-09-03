const Applications = await Service.import('applications');
import { statusline_mode } from '../../shared/vars.js';

const common = [
  'kitty',
  'firefox',
];

const allApps = Variable([]);
const revArray = Variable([]);
const selectedIndex = Variable(0);
var revIndex = 0;

function launchApp() {
  const index = selectedIndex.value;
  if (index !== -1) {
    allApps.value[index].attribute.launch();
    statusline_mode.value = 'normal';
  }
}

function reset() {
  const apps = Applications.query('');
  allApps.value = [
    ...apps.map(AppItem),
    AppItem({ name: 'none' }, -1)
  ];

  // Finds indexes of common apps to be displayed initially
  const commonApps = [];
  allApps.value.map(
    (app, i) => {
      if (common.includes(app.attribute.name.toLowerCase())) {
        commonApps.push(i);
      }
    }
  );
  revArray.value = commonApps;
  selectedIndex.value = revArray.value[0];
  revIndex = 0;
}

function update(text) {
  const arr = [];
  allApps.value.slice(0, -1).forEach(
    (app, i) => {
      const rev = app.attribute.name.toLowerCase().match(text);
      if (rev) arr.push(i);
    }
  );

  if (!arr.length) {
    revArray.value = [-1];
    selectedIndex.value = -1;
  } else {
    revArray.value = arr.slice(0, 10);
    selectedIndex.value = arr[0];
  }

  revIndex = 0;
}

function next() {
  if (revIndex < revArray.value.length - 1) {
    revIndex++;
    selectedIndex.value = revArray.value[revIndex];
  }
}

function prev() {
  if (revIndex > 0) {
    revIndex--;
    selectedIndex.value = revArray.value[revIndex];
  }
}

const AppItem = (app, i) => {
  const main = Widget.Revealer({
    transition: 'slide_down',
    attribute: app,
    reveal_child: revArray.bind().as(
      ri => ri.includes(i)
    ),
    child: Widget.Label({
      class_name: selectedIndex.bind().as(
        si => i === si ? 'app selected' : 'app'
      ),
      label: app.name.toLowerCase(),
      truncate: 'end',
      justification: 'left',
      max_width_chars: 16,
      xalign: 0,
    }),
  });
  return main;
}

const AppLauncherInput = () => {
  App.addWindow(AppLauncherMenu());

  const main = Widget.Box({
    children: [
      Widget.Label(':'),
      Widget.Entry({
        on_change: ({ text }) => {
          update(text);
        },
        on_accept: () => launchApp(),
        setup: (self) => self.hook(statusline_mode, () => {
          if (statusline_mode.value !== 'appLauncher') {
            App.closeWindow('appLauncherMenu');
            self.text = '';
            return;
          }
          self.grab_focus();
          reset();
          App.openWindow('appLauncherMenu');
        }),
      }),
    ],
  });

  main.keybind('Escape', () => {
    statusline_mode.value = 'normal';
  });
  main.keybind(['CONTROL'], 'j', () => {
    next();
  });
  main.keybind(['CONTROL'], 'k', () => {
    prev();
  });

  return main;
}

const AppLauncherMenu = () => {
  const main = Widget.Window({
    name: 'appLauncherMenu',
    class_name: 'app_launcher',
    layer: 'top',
    anchor: ['top', 'left'],
    child: Widget.Box({
      class_name: 'apps',
      vertical: true,
      children: allApps.bind(),
    }),
  });

  return main;
}

export { AppLauncherInput, AppLauncherMenu };
