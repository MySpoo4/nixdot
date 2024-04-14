import Divider from './divider.js';

const Battery = await Service.import('battery');

const BatteryIndicator = () => {
  const revealPercent = Variable(false);
  const main = Widget.EventBox({
    class_name: 'battery',
    visible: Battery.bind('available'),
    on_primary_click: () => revealPercent.value = !revealPercent.value,
    child: Widget.Box({
      children: [
        Divider(),
        Widget.Box({
          class_name: 'battery',
          children: [
            Widget.Icon({
              class_name: 'battery_icon',
              icon: Battery.bind('icon_name'),
            }),
            Widget.Revealer({
              reveal_child: revealPercent.bind(),
              transition: 'slide_right',
              transition_duration: 100,
              sensitive: true,
              child: Widget.Label({
                class_name: 'percent',
                label: Battery.bind('percent').as(
                  p => `${p}%`
                ),
              }),
            }),
          ],
        }),
      ],
    }),
  });

  return main;
}

export default BatteryIndicator;
