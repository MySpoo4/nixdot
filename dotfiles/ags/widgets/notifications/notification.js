const Notification = (notification) => {
  const Icon = ({ app_entry, app_icon, image }) => {
    if (image) {
      return Widget.Box({
        vpack: 'start',
        hexpand: false,
        class_image: 'icon_img',
        css: `background-image: url("${image}")`,
      });
    }

    let icon = 'preferences-desktop-notification-bell';

    if (Utils.lookUpIcon(app_icon)) {
      icon = app_icon;
    }

    if (Utils.lookUpIcon(app_entry)) {
      icon = app_entry || "";
    }

    return Widget.Box({
      vpack: 'start',
      hexpand: false,
      class_name: 'app_icon',
      child: Widget.Icon({
        class_name: 'app_icon',
        icon,
        size: 60,
      }),
      hpack: 'center', hexpand: true,
      vpack: 'center', vexpand: true,
    });

  }

  const AppName = Widget.Label({
    class_name: 'app_name',
    label: notification.app_name.toUpperCase(),
    truncate: 'end',
    justification: 'left',
    max_width_chars: 16,
    xalign: 0,
  });
  
  const Summary = Widget.Label({
    class_name: 'summary',
    label: notification.summary,
    justification: 'left',
    truncate: 'end',
    max_width_chars: 24,
    xalign: 0,
    use_markup: true,
  });

  const Body = Widget.Label({
    class_name: 'body',
    label: notification.body,
    hexpand: true,
    max_width_chars: 24,
    wrap: true,
    justification: 'left',
    lines: 2,
    truncate: 'end',
    xalign: 0,
    use_markup: true,
  });

  const main = Widget.Box({
    class_name: `notification ${notification.urgency}`,
    child: Widget.Button({
      on_primary_click: () => notification.dismiss(),
      child: Widget.Box({
        spacing: 8,
        children: [
          Icon(notification),
          Widget.Box({
            class_name: 'meta',
            vertical: true,
            spacing: 4,
            children: [
              AppName,
              Summary,
              Body,
            ],
          }),
        ],
      }),
    }),
  })

  return main;
  //
  // return Widget.Label('test');
}

export default Notification;
