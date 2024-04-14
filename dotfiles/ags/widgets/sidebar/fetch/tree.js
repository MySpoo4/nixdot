function createTree(structure) {
  const tree = [];

  function traverse(parent, nested) {
    const keys = Object.keys(parent);

    for (let i = 0; i < keys.length; i++) {
      const key = keys[i];
      const child = parent[key];

      tree.push(
        Widget.Box({
          class_name: 'tree_item',
          children: [
            Widget.Box({
              setup: (self) => {
                const spaces = Widget.Label('  '.repeat(nested));

                if (child.type === 'dir') {
                  self.class_name = `dir ${key} dir${nested}`;
                  self.children = [
                    spaces,
                    Widget.Icon({
                      class_name: 'down',
                      icon: 'pan-down-symbolic',
                      size: 12,
                    }),
                    Widget.Icon({
                      class_name: 'folder',
                      icon: 'folder-open-symbolic',
                      size: 12,
                    }),
                    Widget.Label({
                      class_name: 'text',
                      label: `${key}`,
                      xalign: 0,
                    }),
                  ];
                }

                if (child.type === 'file') {
                  self.class_name = `file ${key}`;
                  self.children = [
                    spaces,
                    Widget.Icon({
                      class_name: 'icon',
                      icon: child.icon,
                    }),
                    Widget.Label({
                      class_name: 'text',
                      label: `${key}${' '.repeat(child.spacing ?? 1)}-> ${child.value}`,
                    }),
                  ];
                }

                if (child.type === 'widget') {
                  self.class_name = `widget ${key}`;
                  self.children = [
                    spaces,
                    Widget.Icon({
                      class_name: 'icon',
                      icon: child.icon,
                    }),
                    Widget.Label({
                      class_name: 'text',
                      label: `${key}${' '.repeat(child.spacing ?? 1)}-> `,
                      xalign: 0,
                    }),
                    child.widget,
                  ];
                }

                if (child.type === 'custom') {
                  self.class_name = `custom ${key}`;
                  self.children = [
                    spaces,
                    child.child,
                  ];
                }
              }
            })
          ]
        })
      );
      // recursive call to traverse tree
      if (child.type === 'dir' && child.children) {
        traverse(child.children, nested + 1);
      }
    }
  }
  // first call
  traverse(structure, 0);
  return tree;
}

export default createTree;
