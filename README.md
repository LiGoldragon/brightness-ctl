# brightness-ctl

Laptop backlight control daemon. Wraps `/sys/class/backlight/*` with
dim-on-idle and step-up/step-down helpers for keybindings.

Used by CriomOS as a flake input.

## Usage

- `brightness-ctl up` / `brightness-ctl down` — single-step adjust.
- `brightness-ctl daemon` — runs the idle-dim loop.

## Consumption

```nix
inputs.brightness-ctl.url = "github:LiGoldragon/brightness-ctl";
# → inputs.brightness-ctl.packages.${system}.default
```

## Conventions

- Jujutsu only.
- Mentci three-tuple commit format.
