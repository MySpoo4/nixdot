import { statusline_mode } from '../../shared/vars.js';

const Hyprland = await Service.import('hyprland');

const ModeIndicator = () => {
  const Workspace = () => {
    return Widget.Label({
      class_name: 'workspace',
      label: Utils.merge([Hyprland.active.workspace.bind('id'), Hyprland.bind('workspaces')],
        (i, w) => `${i}:${w.length}`
      ),
    });
  }

  const AppLauncher = () => {
    return Widget.Label({
      class_name: 'applauncher',
      label: statusline_mode.bind().as(
        m => m === 'appLauncher' ? 'APP LAUNCHER' : ''
      ),
    });
  }

  const CommandLauncher = () => {
    return Widget.Label({
      class_name: 'cmdlauncher',
      label: statusline_mode.bind().as(
        m => m === 'cmdLauncher' ? 'COMMANDS' : ''
      ),
    });
  }

  const main = Widget.Stack({
    class_name: 'mode_indicator',
    shown: statusline_mode.bind(),
    children: {
      normal: Workspace(),
      appLauncher: AppLauncher(),
      cmdLauncher: CommandLauncher(),
    },
  });

  return main;
}

export default ModeIndicator;
