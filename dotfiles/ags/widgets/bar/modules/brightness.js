import { Widget, Brightness } from '../../imports.js';

const BrightnessLabel = () => {
  return Widget.Box({
    className: 'brightness',
    children: [
      Widget.Label({
        label: Brightness.bind('screen-value').as(
          v => {
            const category = {
              90: '󰛨',
              70: '󱩔',
              40: '󱩑',
              20: '󱩏',
              0: '󰛩',
            };
            const icon = [90, 70, 40, 20, 0].find(
              (threshold) => threshold <= v * 100
            );

            return category[icon];
          }
        ),
        tooltip_text: Brightness.bind('screen-value').as(
          v => `${Math.floor(v * 100)}%`
        ),
      }),
    ],
  });
};

export default BrightnessLabel;
