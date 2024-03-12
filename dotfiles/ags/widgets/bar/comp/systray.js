import BatteryLabel from '../modules/battery.js';
import NetworkLabel from '../modules/network.js';
import VolumeLabel from '../modules/volume.js';
import Separator from '../../common/separator.js';

const SysTray = () => {
  const container = Widget.Box({
    class_name: 'systray',
    children: [
      Separator(),
      BatteryLabel(),
      Separator(),
      VolumeLabel(),
      Separator(),
      NetworkLabel(),
      Separator(),
    ],
  });

  return container;
}

export default SysTray;
