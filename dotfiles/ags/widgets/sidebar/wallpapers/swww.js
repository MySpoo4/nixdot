const image_resize = `${App.configDir}/widgets/sidebar/wallpapers/image_resize`;
const wp_path = `${Utils.HOME}/dotfiles/swww/current`;
const wp_name = 'current';
const source = `${Utils.HOME}/dotfiles/swww`;
const imgs = `${App.configDir}/widgets/sidebar/wallpapers/imgs`;

const [length, width] = [256, 256];

const wp_map = new Map();

const wp_files = Variable([]);

async function initWallpaper() {
  await Utils.exec("swww init");

  const swww = queryWallpapers(source);

  // check if walls match
  const p = swww.map(f => f.replace(/^.*[/]/, ''));
  const n = queryWallpapers(imgs).map(f => f.replace(/^.*[/]/, ''));
  const eq = p.every(i => n.includes(i)) && n.every(i => p.includes(i));

  if (!eq) {
    // removes contents inside img dir
    Utils.exec(`bash -c "rm -f ${imgs}/*"`)
    // resizes walls and creates them in img dir
    await Utils.execAsync([
      image_resize, source, imgs,
      `${length}`, `${width}`,
      wp_name,
    ]).catch(e => console.log(e));
  }

  // Creates map, mapping name to path
  swww.forEach((val, i) => {
    const key = p[i];
    wp_map.set(key, val);
  });
  wp_files.value = [ ...wp_map.keys() ];

  await setWallpaper().catch(e => console.log(e));
}

async function setWallpaper() {
  await Utils.execAsync([
    'swww', 'img',
    '--transition-type', 'wipe',
    '--transition-duration', '2',
    wp_path,
  ]);
}

async function changeWallpaper(file) {
  const true_path = wp_map.get(file);
  await Utils.execAsync(`rm ${source}/current`);
  await Utils.execAsync(`ln -s ${true_path} ${source}/current`).catch(e => console.log(e));
  await setWallpaper();
}

function queryWallpapers(path) {
  return Utils.exec(`find -L ${path} -iname '*.png' -or -iname '*.jpg'`)
    .split('\n');
}

function getWpPath(file) {
  return `${imgs}/${file}`;
}


export {
  wp_files,
  initWallpaper,
  changeWallpaper,
  getWpPath,
}
