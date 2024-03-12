import { Widget, Audio } from '../../imports.js';

const VolumeLabel = () => {
  return Widget.Box({
    className: 'volume',
    children: [
      Widget.Label({
        label: Audio.speaker.bind('volume').as(
          (v) => {
            const category = {
              67: '󰕾',
              34: '󰖀',
              1: '󰕿',
              0: '󰸈',
            };
            const vol = Math.floor(v * 100);

            const icon = Audio.speaker.isMuted ? 0 : [67, 34, 1, 0].find(
              (threshold) => threshold <= v * 100
            );

            return `${vol}% ${category[icon]}`;
          }
        ),
      }),
    ],
  });
};

export default VolumeLabel;
