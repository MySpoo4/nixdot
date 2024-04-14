const cpu_val = Variable('', {
  poll: [2500, 'top -b -n 1', out => {
    // console.log('polling cpu');
    const cpu = out
      .split('\n')
      .find(line => line.includes('Cpu(s)'))
      .split(/\s+/)[1]
      .replace(',','.');
    return (parseFloat(cpu) / 100);
  }],
});

const ram_val = Variable('', {
  poll: [2500, 'free', out => {
    // console.log('polling ram');
    const [total, used] = out
      .split('\n')
      .find(line => line.includes('Mem:'))
      .split(/\s+/)
      .splice(1,2);
    return (parseFloat(used) / parseFloat(total));
  }],
});

const disk_val = Variable('', {
  poll: [2500, 'df -h', out => {
    // console.log('polling disk');
    const [size, used] = out
      .split('\n')
      .find(line => line.endsWith('/'))
      .split(/\s+/)
      .map(v => v.replace(/G/g, ''))
      .splice(1, 2);
    return (parseFloat(used) / parseFloat(size));
  }],
});

const uptime = Variable('', {
  poll: [60000, 'uptime', out => {
    // console.log('polling uptime');
    const time = out.split('  ')[2].slice(1, -1);
    return time;
  }],
});

var is_polling = true;

function startPollAll() {
  cpu_val.startPoll();
  ram_val.startPoll();
  disk_val.startPoll();
  uptime.startPoll();
  is_polling = true;
}

function stopPollAll() {
  if (is_polling) {
    cpu_val.stopPoll();
    ram_val.stopPoll();
    disk_val.stopPoll();
    uptime.stopPoll();
    is_polling = false;
  }
}

stopPollAll();

export {
  cpu_val,
  ram_val,
  disk_val,
  uptime,
  startPollAll,
  stopPollAll,
}
