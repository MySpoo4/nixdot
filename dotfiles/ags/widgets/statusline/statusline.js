import ModeIndicator from './comps/mode_indicator.js';
import Time from './comps/time.js';
import User from './comps/user.js';
import BatteryIndicator from './comps/battery.js';
import Distro from './comps/distro.js';
import Active from './comps/active.js';
import { AppLauncherInput } from './modes/app_launcher.js';
import { CommandLauncherInput } from './modes/command_launcher.js';
import { statusline_mode } from '../shared/vars.js';
import Gdk from 'gi://Gdk';

const Left = () => {
  const left = Widget.Box({
    class_name: 'left',
    hexpand: true,
    homogeneous: false,
    spacing: 8,
    children: [
      Active(),
    ],
  });
  
  const main = Widget.Box({
    child: Widget.Stack({
      shown: statusline_mode.bind(),
      children: {
        normal: left,
        appLauncher: AppLauncherInput(),
        cmdLauncher: CommandLauncherInput(),
      },
    }),
  });

  return main;
};

const Center = () => {
  const main = Widget.Box({
    class_name: 'center',
    spacing: 8,
    children: [
    ],
  });
  return main;
};

const Right = () => {
  return Widget.Box({
    class_name: 'right',
    hpack: 'end',
    children: [
      Distro(),
      BatteryIndicator(),
      User(),
      Time(),
      ModeIndicator(),
    ],
  });
};

const StatusLine = (monitor = 0) => {
  return Widget.Window({
    name: `bar`,
    class_name: 'statusline_window',
    monitor,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    keymode: statusline_mode.bind().as(
      v => v === 'normal' ? 'none' : 'exclusive'
    ),
    child: Widget.CenterBox({
      class_name: 'line',
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
};


export default StatusLine;
