import { Widget, Variable } from '../../imports.js';

const date = Variable('', {
  poll: [60000, 'date "+%H:%M"'],
});

const Date = () => {
  const container = Widget.Box({
    class_name: 'date',
    children: [
      Widget.Label({
        label: date.bind(),
      }),
    ],
  });

  return container;
};

export default Date;
