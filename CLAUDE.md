# CLAUDE.md — HelloPlugin

**Plugin ID:** `hello_world`
**Display name:** `Hello Plugin`
**Status:** complete — reference implementation, do not add features

## Purpose

This is the canonical minimal plugin for Notetux++. Its only job is to be the simplest
possible valid plugin: two menu items, one NPPM call, no panels, no state beyond `hostMsg`.

When the plugin ABI changes in the main app (`notetux/src/plugin.c`), this plugin must be
updated first and kept working — it is the smoke test that the ABI itself is correct before
touching any real plugin.

## What is implemented

- `getName` / `getFuncsArray` / `beNotified` / `messageProc` / `isUnicode` / `setInfo`
- Menu: **Plugins → Hello Plugin → Say Hello** — dialog showing the current file path via
  `NPPM_GETFULLCURRENTPATH`
- Menu: **Plugins → Hello Plugin → About…** — version dialog

## Source

```
HelloPlugin/HelloPlugin.c   ← single file, ~106 lines
Makefile                    ← gcc -shared -fPIC $(pkg-config gtk+-3.0)
```

## Build and install

```sh
make          # → HelloPlugin/HelloPlugin.so
make install  # → ~/.config/notetux/plugins/HelloPlugin/HelloPlugin.so
```

## Work to do

- Add `plugin_api.h` as a shared header (currently the ABI types are copy-pasted inline
  into `HelloPlugin.c`). Once the main app exposes `notetux/src/plugin_api.h`, replace
  the inline definitions with `#include "../plugin_api.h"`.
- Add `.github/workflows/build.yml` to compile the `.so` and attach it to a GitHub Release.
- Update `nppPluginList/v1/notetux_plugin_list.json` with the real SHA-256 once the first
  release asset exists.
- Note: `gtk_dialog_run` is used here intentionally (simplicity). Do NOT change it to the
  singleton pattern — that complexity belongs in real plugins, not the reference.
