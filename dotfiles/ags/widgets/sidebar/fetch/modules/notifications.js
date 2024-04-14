import createTree from '../tree.js';

const Notifications = await Service.import('notifications');

const container = Widget.Box({
  vertical: true,
});

container.hook(Notifications, (self) => {
  const notifs = Notifications.notifications;
  const list = notifs.reduce(
    (acc, notif) => {
      const app_name = `${notif.app_name.slice(0, 20)}`;
      if (!acc[app_name]) {
        acc[app_name] = {
          type: 'dir',
          length: 0,
          children: {},
        };
      }
      
      acc[app_name].length++;
      if (acc[app_name].length <= 3) {
        acc[app_name].children[notif.id] = {
          type: 'custom',
          child: Widget.Button({
            on_clicked: () => {
              notif.close();
            },
            child: Widget.Label({
              label: notif.summary,
              max_width_chars: 25,
              truncate: 'end',
            }),
          }),
        };
      }
      return acc;
    },
    {},
  );

  for (const [key, val] of Object.entries(list)) {
    list[`${key} (${val.length})`] = val;
    delete list[key];
  }

  self.children = createTree({
    notifications: {
      type: 'dir',
      children: list,
    }
  });

}, 'changed');

const notifications = {
  type: 'custom',
  child: container,
}

export default notifications;
