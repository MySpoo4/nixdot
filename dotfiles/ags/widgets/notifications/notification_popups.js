import Notification from './notification.js';
const notifications = await Service.import('notifications');

notifications.popupTimeout = 5000;
notifications.forceTimeout = true;

const Animated = (id) => {
  const n = notifications.getNotification(id);
  const widget = Notification(n);

  const vars = Variable(false);
  const inner = Widget.Revealer({
    transition: 'slide_right',
    transition_duration: 1000,
    child: widget,
  });

  const outer = Widget.Revealer({
    transition: 'slide_down',
    transition_duration: 500,
    child: inner,
  });

  const box = Widget.Box({
    hpack: 'end',
    child: outer,
  });

  Utils.idle(() => {
    outer.reveal_child = true;
    Utils.timeout(500, () => {
      inner.reveal_child = true;
    });
  });

  return Object.assign(box, {
    dismiss() {
      inner.reveal_child = false;
      Utils.timeout(1000, () => {
        outer.reveal_child = false,
        Utils.timeout(500, () => {
          box.destroy();
        });
      });
    },
  });
}

const PopupList = () => {
  const map = new Map();

  function remove(_, id) {
    map.get(id)?.dismiss();
    map.delete(id);
  }

  const main = Widget.Box({
    class_name: 'notifications',
    spacing: 8,
    hpack: 'end',
    vertical: true,
  });

  main.hook(notifications, (_, id) => {
    if (id !== undefined) {
      const w = Animated(id);
      map.set(id, w);
      main.children = [w, ...main.children];
    }
  }, 'notified')
    .hook(notifications, remove, 'dismissed')
    .hook(notifications, remove, 'closed'); 

  return main;
}

const Notifications = () => {
  const main = Widget.Window({
    name: 'notifications',
    class_name: 'notifications_window',
    anchor: ['top', 'right'],
    child: Widget.Box({
      css: 'padding: 1px',
      child: PopupList(),
    }),
  });

  return main;
}

export default Notifications;
