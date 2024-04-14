import { brightness } from '../../../imports.js';
const Audio = await Service.import('audio');

const desktop_controls = {
  type: 'dir',
  children: {
    volume: {
      type: 'widget',
      icon: 'audio-speakers-symbolic',
      widget: Widget.Box({
        homogeneous: false,
        children: [
          Widget.Label('['),
          Widget.Slider({
            class_name: 'slider',
            draw_value: false,
            hexpand: true,
            min: 0,
            max: 1,
            value: Audio.speaker.bind('volume'),
            on_change: ({ value }) => {
              Audio.speaker.volume = value;
            },
          }),
          Widget.Label(']'),
        ],
      }),
    },
    bright: {
      type: 'widget',
      icon: 'display-brightness-symbolic',
      widget: Widget.Box({
        homogeneous: false,
        children: [
          Widget.Label('['),
          Widget.Slider({
            class_name: 'slider',
            draw_value: false,
            hexpand: true,
            min: 0,
            max: 1,
            value: brightness.bind('screen_value'),
            on_change: ({ value }) => {
              const val = value > .05 ? value : .05;
              brightness.screen_value = val;
            },
          }),
          Widget.Label(']'),         
        ],
      }),
    },
  },
}

export default desktop_controls;
