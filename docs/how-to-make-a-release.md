# How To Make a New Release

Once a module or an addon is ready for a new release you can follow the instructions here for be sure to made all
the relevant steps before making the tag.

## Changelog

The main CHANGELOG.md file in the project root contains links to the actual CHANGELOG that are separate for every
modules and addons and are situated inside the folder `modules/<category>/<module-name>` for the modules and
`/addons/<category>/<addon-name>` for the addons.  
Every changes must be added to the correct CHANGELOG; and in case that the change is the creation of a new module
or addon a link to the new CHANGELOG file must be added to the root one.

## Tags

After the changelogs are updated the relevant tag can be created, the name of the tag dependes on what are you tagging:

- if the tag pertain to a module the tag must be `module-<category>-<name>-v<semver>`
- if the tag pertain to an addon the tag must be `addon-<category>-<name>-v<semver>`
