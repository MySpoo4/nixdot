const Hyprland = await Service.import('hyprland');

const Active = () => {
  const main = Widget.Label({
    class_name: 'active',
    label: Hyprland.bind('active').as(
      v => v.client.class ? v.client.class : 'nixos'
    ),
  });

  return main;
}

export default Active;
