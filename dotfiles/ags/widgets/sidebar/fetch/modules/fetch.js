import { uptime } from './vars.js';

function getDistro() {
  const val = Utils.exec('bash -c "cat /etc/*-release"');
  const name = val
    .split('\n')
    .find(line => line.includes('DISTRIB_ID'))
    .split('=')[1];
  return name;
}

const fetch = {
  type: 'dir',
  children: {
    os: {
      type: 'file',
      icon: 'computer-symbolic',
      spacing: 3,
      value: getDistro(),
    },
    user: {
      type: 'file',
      icon: 'user-available-symbolic',
      value: Utils.exec(`whoami`),
    },
    host: {
      type: 'file',
      icon: 'network-server-symbolic',
      value: Utils.exec(`hostname`),
    },
    up: {
      type: 'widget',
      icon: 'timer-symbolic',
      spacing: 3,
      widget: Widget.Label({
        label: uptime.bind(),
      }),
    }
  }
}

export default fetch;
