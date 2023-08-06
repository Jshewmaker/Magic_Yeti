<!--
  Thanks for contributing!

  Provide a description of your changes below and a general summary in the title

  Please look at the following checklist to ensure that your PR can be accepted quickly:
-->

## Description

<!--- Describe your changes in detail -->

## Checklist before submitting PR

<!--- Put an `x` in all the boxes that apply: -->

- [ ] 👀 I ensured that my PR is small enough to be easy to review. 
- [ ] 👀 I have performed a self-review of my own code. Keep in mind the following rules:
  - keep the widget tree shallow and create small widgets
  - if widget needs to be accessible in tests, make sure to add `@visibleForTesting` attribute
  - make sure the variables names are meaningful and descriptive
- [ ] 🧪 I have run the following commands locally in the project root and each modified package.
  - `fvm flutter format --set-exit-if-changed lib test`
  - `fvm flutter analyze lib test`
  - `tool/coverage.sh` or `tool/covergage.sh packages/some_package`
- [ ] 📸 I have attached screenshot(s) or GIF(s) showing my work in action (if applicable). 
- [ ] 📲 I have tested my solution on different screen resolutions (if applicable).
- [ ] 🎯 I have linked ticket(s) from the Monday board.

## Type of Change

<!--- Put an `x` in all the boxes that apply: -->

- [ ] ✨ New feature (non-breaking change which adds functionality)
- [ ] 🛠️ Bug fix (non-breaking change which fixes an issue)
- [ ] ❌ Breaking change (fix or feature that would cause existing functionality to change)
- [ ] 🧹 Code refactor
- [ ] ✅ Build configuration change
- [ ] 📝 Documentation
- [ ] 🗑️ Chore
