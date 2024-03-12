import Date from './modules/date.js';
import SysTray from './comp/systray.js';

const Left = () => {
  return Widget.Box({
    spacing: 8,
    children: [
    ],
  });
};

const Center = () => {
  return Widget.Box({
    spacing: 8,
    children: [
    ],
  });
};

const Right = () => {
  return Widget.Box({
    hpack: 'end',
    children: [
      SysTray(),
      Date(),
    ],
  });
};

const Bar = (monitor = 0) => {
  return Widget.Window({
    name: `bar`,
    class_name: 'bar',
    monitor,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
};

export default Bar;
