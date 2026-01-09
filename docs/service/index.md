# Getting Started

Welcome to **Cadify Service**, the background CAD processor service application that silently drives your web shop by creating exact 3D CAD models and technical documentation on customer demand.

This guide will help you get up and running with Cadify Service, covering nopCommerce connection, usage, authorization and job management.

## Requirements

Cadify Service is a Windows desktop application set up with a 64-bit installer. It connects Excel-based Cadify Tables to parametrized SolidWorks CAD models, therefore, the minimum system requirements are the following:

- A PC meeting SolidWorks' minimum system requirements.
- A 64-bit Windows operating system with active support.
- Microsoft Office 365 or compatible Microsoft Office (e.g. 2016).
- SolidWorks 2020.
- A Cadify installer containing the Cadify Service component.

## Installation

After getting an installer file from our private channels, installation is pretty straightforward. The installation wizard configures everything it needs for Cadify to work as intended. The installer version with Cadify Service included installs the followng components:

- Cadify SolidWorks AddIn
- Cadify Excel plugin
- Cadify Service
- Developer Tools

The installer handles all installed components as a single package. Upgrade and removal follow standard Windows procedures. With a newer installer, all installed components get upgraded. If not needed anymore, everything can be uninstalled with Windows' built-in removal tool (accessed from Applications or Control Panel) seamlessly.

## Post-installation

Some conveniece functions have such security implications, that we must not take the liberty to configure them during installation. On demand, the following functionalities must be configured on every computer manually after the installation process.

### Starting Cadify Service automatically

Since Cadify Service is a user-space application (not a system service) for extra security and UX convenicence, it cannot be started without a logged in user. Therefore, if Cadify Service must start automatically with the computer and the operating system, Windows must be configured to log in the default user automatically when started.

On a successful login, Cadify Service starts automatically if the corresponding checkbox was checked in during the installation process.

### Enabling or disabling system notifications

On special occasions, Cadify Service asks for the user's attention by triggering system notifications. By default, these notifications appear on screen for a limited time and then accessible through Windows' notifications system tray button. Cadify Service notifications can be enabled or disabled by enabling or disabling Windows notifications globally.

## Starting Cadify Service

Once installed, Cadify Service can be started anytime by launching it from the Start Menu, its desktop shortcut, or its executable. It cannot launch if it finds a running Cadify Service or SolidWorks application. After launching, Cadify Service is accessible from the system tray through its C-shaped notification icon:

![Cadify Service notification icon](./images/01-tray-icon.jpg)

Cadify Service typically uses status text and notification messages to communicate with the user. The current state of the service can be accessed by hovering over its notification icon. If the service needs special user attention, it triggers a system notification:

![Cadify Service first system notification](./images/02-login-notification.jpg)

Users can access most Cadify Service functionality through the tray icon's **context menu**, available by left-clicking on it:

![Cadify Service context menu](./images/03-tray-menu.jpg)

## Cadify Service lifecycle

Cadify Service is built with an internal state management system with several lifecycle states. Each state defines the current capabilities of Cadify Service: what can it do at the moment and what is forbidden. The following states have special meaning to the user and reflected through the tray icon:

- **Stopped**: The service is stopped and not connected to any Cadify Web store.
- **Idle**: The service is awaiting a new job request.
- **Working**: The service is actively working on a job.
- **Paused**: The service is temporarily paused by an operator and will resume later. Until then it enqueues new requests but won't start them.
- **Starting**: The service is in its starting routine. It can enqueue new job requests, but it cannot run jobs yet.
- **Stopping**: The service is requested to be halted, but it is currently busy with either synchronization or executing a job. It will stop as soon as possible.

> When Cadify Service stops or exits, it needs to wait for the current job (if any) to finish in order to prevent incomplete generations, possibly leading to unsatisfied customers.