# 2026. 01. 09.

The documentation development and deployment workflow has been updated to make the system more flexible and easier to extend. The previous setup relied on hard-coded executables and IDE-specific configuration files, which made customization and additional build steps difficult. With upcoming scripting requirements forWordPress search, the documentation system is now containerized using DevContainers to ensure consistent dependencies across local development and deployment.

Documentation is developed and previewed from within the DevContainer using MKDocs, while deployment is handled through a custom GitHub Actions workflow. The documentation site is built using the same dependencies as local development and the generated artifacts are uploaded directly to GitHub Pages.

As part of this change, the gh-pages branch has been removed. A develop branch is used for ongoing documentation development, and deployments are triggered from the main branch. The user manual is gradually moving towards a left-hand table-of-contents–only navigation structure, with existing pages being aligned over time as they are updated.

# 2025. 06. 13.

The Cadify User Manual is built using MKDocs and published via GitHub Pages. The documentation source lives in the docs/ directory and is configured through mkdocs.yml.