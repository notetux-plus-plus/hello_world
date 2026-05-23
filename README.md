# HelloPlugin

A minimal reference plugin for [Notetux++](https://github.com/notetux-plus-plus/notetux-plus-plus).

This is the canonical example of the smallest valid Notetux++ plugin: two menu items, one NPPM
call, no panels, no persistent state. Read this before writing your own plugin.

## Features

- **Plugins → Hello Plugin → Say Hello** — shows a dialog with the full path of the currently open file
- **Plugins → Hello Plugin → About…** — shows the plugin version

## Requirements

- GCC with C11 support
- GTK3 (`libgtk-3-dev` on Debian/Ubuntu)
- Notetux++ installed

## Build

```sh
make
```

Produces `HelloPlugin/HelloPlugin.so`.

## Install

```sh
make install
```

Copies the `.so` to `~/.config/notetux/plugins/HelloPlugin/HelloPlugin.so`.

## Project layout

```
HelloPlugin/
├── HelloPlugin.c   ← plugin source (~106 lines, C11)
└── Makefile
plugin_api.h        ← Notetux++ plugin ABI header
```

## Plugin ABI

HelloPlugin implements all six exports required (or available) by the Notetux++ plugin API:

| Export | Description |
|--------|-------------|
| `getName` | Returns `"Hello Plugin"` |
| `getFuncsArray` | Returns the two menu items |
| `setInfo` | Captures the `hostMsg` function pointer from the host |
| `beNotified` | No-op (no SCN events handled) |
| `messageProc` | No-op |
| `isUnicode` | Returns `1` |

The only NPPM message used is `NPPM_GETFULLCURRENTPATH` (called from `hello_action`).

## License

Same license as the Notetux++ project.
