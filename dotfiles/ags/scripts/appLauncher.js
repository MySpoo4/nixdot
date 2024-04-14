const mode = (await import(`file://${App.configDir}/widgets/shared/vars.js`)).statusline_mode;
mode.value = mode.value !== 'appLauncher' ? 'appLauncher' : 'normal';
