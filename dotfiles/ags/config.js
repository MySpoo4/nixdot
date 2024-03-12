import Bar from './widgets/bar/bar.js';

App.resetCss();

const scss = `${App.configDir}/styles/main.scss`;
const css = `${App.configDir}/style.css`;
Utils.exec(`sassc ${scss} ${css}`);

App.applyCss(css);

App.config({
  icons: './assets',
  windows: () => [
    Bar(),
  ],
});

