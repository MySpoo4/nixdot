import { statusline_mode } from '../../shared/vars.js';

const notifications = await Service.import('notifications');

const availableCmds = [
  { name: 'shutdown', fn: () => Utils.exec('systemctl poweroff') },
  { name: 'restart', fn: () => Utils.exec('systemctl reboot') },
  { name: 'suspend', fn: () => Utils.exec('systemctl suspend') },
  { name: 'logout', fn: () => Utils.exec('hyprctl dispatch exit 0') },
  { name: 'notif-clear', fn: () => notifications.clear() },
  // { name: 'change-wallpaper', fn: () => revealWallpapers.value = true }
]

const revArray = Variable([]);
const selectedIndex = Variable(0);
var revIndex = 0;

const CmdItem = (cmd, i) => {
  const main = Widget.Revealer({
    transition: 'slide_down',
    reveal_child: revArray.bind().as(
      ri => ri.includes(i)
    ),
    child: Widget.Label({
      class_name: selectedIndex.bind().as(
        si => i === si ? 'cmd selected' : 'cmd'
      ),
      label: cmd.name,
      xalign: 0,
    }),
  });
  return main;
}

const allCmds = availableCmds.map(CmdItem);
allCmds.push(CmdItem({ name: 'none' }, -1));

function execCmd() {
  const index = selectedIndex.value;
  if (index !== -1) {
    availableCmds[index].fn();
    statusline_mode.value = 'normal';
  }
}

function reset() {
  revArray.value = [...Array(availableCmds.length).keys()].slice(0, 10);
  selectedIndex.value = 0;
  revIndex = 0;
}

function update(text) {
  const arr = [];
  availableCmds.forEach(
    (cmd, i) => {
      const rev = cmd.name.match(text);
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

const CommandLauncherInput = () => {
  App.addWindow(CommandLauncherMenu());

  const main = Widget.Box({
    children: [
      Widget.Label(':'),
      Widget.Entry({
        on_change: ({ text }) => {
          update(text);
        },
        on_accept: () => execCmd(),
        setup: (self) => self.hook(statusline_mode, () => {
          if (statusline_mode.value !== 'cmdLauncher') {
            App.closeWindow('cmdLauncherMenu');
            self.text = '';
            return;
          }
          self.grab_focus();
          reset();
          App.openWindow('cmdLauncherMenu');
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

const CommandLauncherMenu = () => {
  const main = Widget.Window({
    name: 'cmdLauncherMenu',
    class_name: 'cmd_launcher',
    layer: 'top',
    anchor: ['top', 'left'],
    child: Widget.Box({
      class_name: 'cmds',
      vertical: true,
      children: allCmds,
    }),
  });

  return main;
}

export { CommandLauncherInput };
