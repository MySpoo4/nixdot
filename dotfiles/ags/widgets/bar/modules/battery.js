import { Battery, Widget, Utils } from '../../imports.js';

const BatteryLabel = () => {
  return Widget.Box({
    className: 'battery',
    children: [
      Widget.Label({
        label: Utils.merge([Battery.bind('percent'), Battery.bind('charging')],
          (p, c) => {
            const category = {
              95: '󰁹',
              80: '󰂁',
              60: '󰁿',
              40: '󰁽',
              20: '󰁻',
              0: '󰂎',
              'charging': '󱐋',
            };
            const icon = c ? 'charging' : [95, 80, 60, 40, 20, 0].find(
              (threshold) => threshold <= p
            );

            return `${p}% ${category[icon]}`;
          }
        ),
      }),
    ],
  });
};
export default BatteryLabel;
