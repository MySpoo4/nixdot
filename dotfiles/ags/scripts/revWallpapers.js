const rev_sidebar = (await import(`file://${App.configDir}/widgets/shared/vars.js`)).rev_sidebar;
const sidebar_shown = (await import(`file://${App.configDir}/widgets/shared/vars.js`)).sidebar_shown;

if (rev_sidebar.value && sidebar_shown.value === 'wallpapers') {
  rev_sidebar.value = false;
} else {
  rev_sidebar.value = true;
  sidebar_shown.value = 'wallpapers';
}
