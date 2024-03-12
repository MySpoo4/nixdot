import { Widget, Network } from '../../imports.js';

const NetworkLabel = () => {
  return Widget.Box({
    className: 'network',
    children: [
      Widget.Label({
        label: Network.wifi.bind('strength').as(
          v => {
            const category = {
              90: '󰤨',
              67: '󰤥',
              34: '󰤢',
              1: '󰤟',
              0: '󰤯',
              "-1": '󰤮',
            };
            const icon = Network.wifi.internet !== "connected" ? "-1" : [90, 67, 34, 1, 0].find(
              (threshold) => threshold <= v
            );

            return `${v}% ${category[icon]}`;
          }
        ),
      }),
    ],
  });
};

export default NetworkLabel;
