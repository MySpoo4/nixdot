import Divider from './divider.js';

const User = () => {
  const main = Widget.Box({
    children: [
      Divider(),
      Widget.Label({
        class_name: 'user',
        label: Utils.exec('whoami'),
      }),
    ],
  });

  return main;
}

export default User;
