import { 
  wp_files,
  initWallpaper, 
  changeWallpaper, 
  getWpPath,
} from './swww.js'

const Wallpaper = (wallpaper) => {
  const main = Widget.Button({
    class_name: 'wallpaper',
    cursor: 'pointer',
    on_primary_click: async () => {
      await changeWallpaper(wallpaper);
    },
    child: Widget.Icon({
      class_name: 'wp',
      icon: getWpPath(wallpaper),
    }),
  });

  return main;
}

const Wallpapers = () => {
  const list = Widget.Scrollable({
    vexpand: true,
    child: Widget.Box({
      class_name: 'list',
      vertical: true,
      spacing: 12,
      children: wp_files.bind().as(
        wps => wps.map(Wallpaper)
      ),
    }),
  });

  const main = Widget.Box({
    class_name: 'wallpapers',
    vertical: true,
    child: list,
    setup: async (_) => {
      await initWallpaper().catch(e => console.log(e));
    },
  });

  return main;
}

export default Wallpapers;
