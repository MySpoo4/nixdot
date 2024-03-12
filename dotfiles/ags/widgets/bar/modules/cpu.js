import { Widget, Variable } from '../../imports.js';
// icon: 'cpu-symbolic',
//

const divide = ([total, free]) => free / total;
const cpu = Variable(0, {
  poll: [2000, 'top -b -n 1', out => divide([100, out.split('\n')
    .find(line => line.includes('Cpu(s)'))
    .split(/\s+/)[1]
    .replace(',', '.')])],
});

const Cpu = () => {
  return Widget.Box({
    className: 'cpu',
    children: [
      Widget.Label({
        label: ' ',
        tooltip_text: cpu.bind().as(
          v => `${Math.floor(v * 100)}%`
        ),
      }),
    ],
  });
};

export default Cpu;
