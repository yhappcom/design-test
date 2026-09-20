# LogMate HOME-B v0.3 — Color Application Contract

Status: PORTFOLIO-RENDER CONTRACT / NOT FINAL PRODUCTION TOKENS
Date: 2026-09-19
Source: Design Studio C017 + C020–C022

## Selected research direction for this render

Apply C017 **System C — low-chroma operational** as the whole-system visual basis for the HOME-B v0.3 portfolio render.

Reason:
- provisional studio selection for dense operational/data products;
- strongest low-chroma hierarchy;
- high declared light/dark contrast margins;
- action/focus/status roles remain separated;
- data remains visually dominant over chrome.

## Light semantic values for render

- canvas: `#F7F8F8`
- surface: `#FFFFFF`
- primary text: `#1B2224`
- secondary text: `#596164`
- default rule/border: `#C9CED0`
- primary action: `#355F6B`
- on-primary: `#FFFFFF`
- focus: `#654FB0`
- selected surface: `#E0EAED`
- success: `#3F6E55`
- caution: `#776027`
- critical: `#934149`

## Dark semantic values for render

- canvas: `#14191B`
- surface: `#1A2022`
- primary text: `#F0F3F4`
- secondary text: `#BCC3C5`
- default rule/border: `#4B5558`
- primary action: `#9BC3CF`
- on-primary: `#172226`
- focus: `#B8AAE5`
- selected surface: `#29373B`
- success: `#9AC7AA`
- caution: `#D1BC86`
- critical: `#DFA0A6`

## Semantic rules

- light/dark preserve role identity, not literal color identity;
- no RGB inversion;
- focus is not the brand/action color;
- selected and focus remain distinct;
- status color is not reused for ordinary action;
- color never owns state meaning alone;
- data-series colors remain separate from lifecycle/status roles;
- accent is sparse and cannot become decorative section coloring.

## C021/C022 carry-over

C021/C022 reinforce:
- pair contracts matter more than isolated swatches;
- text/state contrast is strong in the bounded candidate research;
- exact rendered component/non-text contrast still requires implementation validation;
- forced-colors/high-contrast acceptance is semantic survival, not preservation of authored hue.

## LogMate-specific application

Home:
- canvas dominates;
- section hierarchy uses spacing/rules/type, not tinted boxes;
- Add flight may use the primary action role;
- View logbook is a quieter secondary action;
- Search is neutral until focused;
- 7D / 28D / 90D / Custom selection uses structural cue + selected role, not color alone.

Add Flight transfer:
- no rounded card sections;
- semantic section title + datum/rules;
- focus color appears only on the active field/control.

View Logbook transfer:
- ledger remains mostly neutral;
- duration/numeric data should not inherit accent color;
- selected/focus/control states use semantic roles only where needed.

## Render limitations

This portfolio render is NOT evidence of:
- physical display behavior;
- CVD/low-vision human performance;
- final Flutter token values;
- independent-browser parity;
- forced-colors PASS;
- final brand-color selection.

After the portfolio render, Type/Color/Layout/Interaction/Web/Content must re-audit the actual composition before final baseline approval.