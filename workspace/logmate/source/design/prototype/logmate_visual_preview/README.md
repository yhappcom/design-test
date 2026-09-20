# LogMate Visual Preview

Design-only Flutter prototype for the active HOME-B v0.4 lineage and its first-use derivations.

## Scope
- Home B v0.4
- Welcome
- Previous Total
- Empty Home
- light/dark semantic mapping

## Non-authority
This prototype is not production code and does not change `lib/`.
It is a review artifact only.

## Current rules embodied
- English-only
- Home ad-free
- 7D / 28D / 90D / Custom
- low-chroma operational palette
- no stock Card / dashboard-card hierarchy
- no greeting/Captain hero
- no marketing feature tour
- Previous Total uses explicit zero/carry and one H+MM editor per duration semantic
- Empty Home is a Home-shell state, not a separate branded empty-state screen

## Run
From this directory:
```bash
flutter pub get
flutter run
```

## Review gates
This prototype must still be reviewed for:
- actual Flutter runtime/rendering
- 200% text
- short-height viewport
- Search + IME
- dark boundary visibility
- grayscale/forced-colors semantics where relevant
- physical-device/browser transfer
- exact production typography/token mapping
