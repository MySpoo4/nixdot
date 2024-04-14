import Divider from './divider.js';

const Time = () => {
  // polls every minute
  const time = Variable('', {
    poll: [60000, 'date "+%I : %M %p"'],
  });

  const date = Variable('', {
    poll: [3600000, 'date "+%b %d"'],
  });

  const rev_date = Variable(false);

  const main = Widget.EventBox({
    on_primary_click: () => rev_date.value = !rev_date.value,
    child: Widget.Box({
      children: [
        Widget.Box({
          class_name: 'date_time',
          children: [
            Widget.Revealer({
              reveal_child: rev_date.bind(),
              transition: 'slide_right',
              transition_duration: 100,
              sensitive: true,
              child: Widget.Box({
                children: [
                  Widget.Label({
                    class_name: 'date_indicator',
                    label: date.bind(),
                  }),
                  Divider(),
                ],
              }),
            }),
            Widget.Label({
              class_name: 'time_indicator',
              label: time.bind(),
            }),
          ],
        }),
      ],
    }),
  });

  return main;
}

export default Time;
