# Cadify Library

This page explains, in simple terms, how Cadify keeps library files synchronized between the local machine and the cloud (Dropbox), what is required for synchronization to run, and basic user guidance.

## What Cadify Library Sync does

- Keeps files and folders in the local Cadify library folder in sync with the Cadify library stored in Dropbox.
- Sync is two way:
  - Files and folders added or changed locally are uploaded to Dropbox.
  - Files and folders added or changed on Dropbox are downloaded to the local library.
- Folder structure is preserved. Files are compared by content, so unchanged files are not re uploaded.

## Where files live in Dropbox

Cadify connects the local library for each nopCommerce store to a matching **Dropbox app folder**.

- Each store gets its own app folder under the Dropbox `Apps` folder.  
- The folder name is based on the store name or URL.

Example:

- Store: `cadify.gratis`  
- Dropbox app folder: `Apps\Cadify.Gratis\Library\`
- Local folder: `C:\Cadify\Library\Cadify.Gratis\`

Inside that app folder, Cadify expects the same library structure as on the local machine (for example `cadify textures`, `weldments`, `parts`, and any subfolders you create).  

This mapping is fixed per store. If you log into another store, Cadify uses a different app folder under `Apps`.

## When synchronization runs (must read)

Automatic synchronization runs only while one of the following is active on the computer:

- SolidWorks is running with the Cadify AddIn installed, or
- The Cadify Service is running, or
- Excel is open with the Cadify Task Pane active (Cadify installed and Task Pane open)

If none of these are active, automatic sync will not occur. To force sync, start any one of these applications or components.

On status bar you can see the state of syncing.
<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/light/taskPane/images/library.png" alt="Syncronized" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">
<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/library/images/Sync.png" alt="Syncing" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

## How local changes are handled

- Cadify watches the local library folder for file and folder events: create, change, rename, delete.
- When a file is created or changed, Cadify computes a content hash and uploads the file to Dropbox if the content is new or changed.
- When a file or folder is renamed or deleted locally, Cadify updates the cloud copy in the app folder accordingly.
- Temporary OS or editor files (paths containing `~`) are ignored to avoid uploading incomplete files.

## How Dropbox (cloud) changes are handled

- Cadify keeps a continuous connection to Dropbox (long poll). When Dropbox reports changes in the relevant app folder, those updates are applied to the local library.
- On startup Cadify performs an initial sync and downloads files that are new or newer than the local copy.

## Base folders created at installation

During installation Cadify creates three base folders inside the local library root:

- `cadify textures` – contains SolidWorks appearance, texture, and color files.
- `weldments` – contains SolidWorks weldment profile files (profiles used by the Weldment tool).
- `parts` – general parts folder for CAD part files.

Important: `cadify textures` and `weldments` are special folders used by SolidWorks for specific file types and must not be renamed. Renaming them can break SolidWorks ability to find those resources.

The same folder names and structure are mirrored under the store specific Dropbox app folder, for example:

- Local: `C:\Cadify\Library\Store.Name\cadify textures`  
- Dropbox: `Apps\Cadify.Gratis\cadify textures`

## Common tasks and workflows

- To add textures or weldment profiles, place the files into `cadify textures` or `weldments`. If sync is active, the files will be uploaded to the Dropbox app folder and distributed to other machines.
- To add parts, place files into `parts` (or subfolders). These will sync like any other files.
- To force a sync, open SolidWorks (with Cadify AddIn), or start the Cadify Service, or open Excel with the Cadify Task Pane.

## Troubleshooting (quick checks)

- Ensure one of the required sync agents is running (SolidWorks with Cadify AddIn, Cadify Service, or Excel Task Pane).
- Confirm internet connectivity and that the Dropbox account or developer token is valid.
- Verify the local Cadify library path exists and is accessible.
- Avoid editing the same file simultaneously on multiple machines, this reduces conflicts.
- If files do not appear, restart SolidWorks, Excel with the Task Pane, or the Cadify Service to trigger the sync agent.

## Best practices

- Do not rename `cadify textures` or `weldments`.
- Add resources (textures, weldment profiles) to the appropriate folder so SolidWorks can use them without extra path configuration.
- Allow a short time for sync to complete after adding or changing files. Uploads and downloads happen automatically but may take a moment.
- Keep a clear store to folder mapping, for example:
  - `cadify.gratis` → `Apps\Cadify.Gratis\Library\`
  - `store.example.com` → `Apps\Store.Example.Com\Library\`

For additional assistance or details about Cadify behavior, consult the help pages provided with the installation or contact the administrator managing the Cadify Dropbox store.