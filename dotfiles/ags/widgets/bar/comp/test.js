import Separator from '../../common/separator.js';

const Test = () => {
  const container = Widget.Box({
    class_name: 'systray',
    children: [
      Separator(),
      Widget.Label({
        label: '',
      }),
      Separator(),
      Widget.Label({
        label: '',
      }),
      Separator(),
      Widget.Label({
        label: '',
      }),
    ],
  });

  return container;
}

export default Test;
