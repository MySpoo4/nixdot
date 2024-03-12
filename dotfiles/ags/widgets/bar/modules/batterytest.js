import { Widget, Battery, Utils, Variable } from '../../imports.js';

const BatteryBox = () => {
  const showState = Variable(false);

  return Widget.Box({
    className: 'big',
    children: [
      Widget.Stack({
        children: {
          'icon': Widget.Button({
            className: 'batteryIcon',
            child: Widget.Icon({
              icon: 'custom-symbolic',
            }),
            onPrimaryClick: () => {
              console.log('pressed');
              showState.value = true;
            },
          }),
          'stat': Widget.CircularProgress({
            className: 'circular',
            value: 1,
            // value: Battery.bind('percent').as(p => p / 100),
            child: Widget.Label({
              className: 'inner',
              label: Battery.bind('percent').as(p => `${p}`),
            }),
            rounded: false,
          }),
        },
        shown: showState.bind().as(
          state => {
            if (state) {
              setTimeout(() => {
                showState.value = false;
              }, 3000);
              return 'stat';
            } else {
              return 'icon';
            }
          }
        ),
      }),
    ],
  });
};

export default BatteryBox;
