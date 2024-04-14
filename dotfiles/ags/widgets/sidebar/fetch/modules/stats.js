import { cpu_val, ram_val, disk_val } from './vars.js';

const stats = {
  type: 'dir',
  children: {
    cpu: {
      type: 'widget',
      icon: 'cpu-symbolic',
      spacing: 2,
      widget: Widget.Box({
        homogeneous: false,
        children: [
          Widget.Label('['),
          Widget.LevelBar({
            class_name: 'metric',
            vpack: 'center',
            hexpand: true,
            value: cpu_val.bind(),
          }),
          Widget.Label(']'),
        ],
      }),
    },
    ram: {
      type: 'widget',
      icon: 'ram-symbolic',
      spacing: 2,
      widget: Widget.Box({

        homogeneous: false,
        children: [
          Widget.Label('['),
          Widget.LevelBar({
            class_name: 'metric',
            vpack: 'center',
            hexpand: true,
            value: ram_val.bind(),
          }),
          Widget.Label(']'),
        ],
      }),
    },
    disk: {
      type: 'widget',
      icon: 'drive-harddisk-system-symbolic',
      widget: Widget.Box({
        homogeneous: false,
        children: [
          Widget.Label('['),
          Widget.LevelBar({
            class_name: 'metric',
            vpack: 'center',
            hexpand: true,
            value: disk_val.bind(),
          }),
          Widget.Label(']'),
        ],
      }),
    },
  },
}

export default stats;
