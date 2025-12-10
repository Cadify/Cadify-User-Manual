# Cadify Substore System

## Technical Overview

This document describes the **full end-to-end setup of a Cadify Substore**, from **Dropbox configuration** through **nopCommerce setup** to **domain and SSL configuration**.  

> **Follow the sections in order when onboarding a new Cadify Client.**

---

## 1. Terminology

This section defines the **key concepts** (*Client, Vendor, Store, etc.*) used throughout the rest of the guide.  
**Make sure these are clear before you start the technical steps.**

### 1.1 Cadify Client

A **Cadify Client** is a Cadify customer that **owns a store and its products**.

> Previously called **Store Owner** (**this term is deprecated**).

A Cadify Client can be either:

- a **Company**, or  
- a **Marketplace**.

### 1.2 Vendor (nopCommerce term)

A **Vendor** is a nopCommerce user type used to **manage store-specific admin pages**.

Technically: a **Customer with Vendor role** in nopCommerce.

In Cadify:

- A **Cadify Client is represented as a Vendor** in nopCommerce so they can manage their store.  
- The term **Vendor** is only used in the **nopCommerce context**.

### 1.3 Cadify Store

A **Cadify Store** is a **nopCommerce Store that belongs to a Cadify Client**.

Each Cadify Store:

- **Corresponds to a specific Cadify Client.**  
- Is connected to **exactly one Dropbox App Folder.**

### 1.4 Dropbox App Folder

A **Dropbox App Folder** is a dedicated Dropbox application folder used to store the **Cadify Client’s product files**.

- It has **restricted access** and **cannot see any other client’s folders**.

Example path:  
`Dropbox\Cadify\Apps\<ClientFolder>`

### 1.5 Cadify Authorization

**Cadify Authorization** is the mechanism that connects a **specific Cadify Store in nopCommerce** to a **specific Dropbox App Folder**.

The relationship is **1:1**:

> **One Store ↔ One Dropbox App Folder**

### 1.6 Site vs Store

A **Site** is the domain environment (e.g., `ovalas.no`).  
A **Store** is a nopCommerce instance under that site (e.g., `main.ovalas.no`).  
A Site can contain many Stores.

---

## 2. Vendor Role and Entity Relationships

In nopCommerce, a **Cadify Client is represented as a Customer with the Vendor role**.  
Cadify uses this structure to enforce **product, customer, and store permissions**.

A Cadify Client must have:

- a **nopCommerce Store (Cadify Store)**  
- a **connected Dropbox App Folder via Cadify Authorization**

Cadify simplifies structure:

> **One Store → One Vendor → One Client**

A Site may have multiple Stores, each mapped to its own Dropbox App Folder.

---

## 3. Client Onboarding Process (High-Level)

The onboarding process has **four main steps**:

1. **Create the Client’s Dropbox App Folder**  
2. **Create the Cadify Client & Vendor in nopCommerce**  
3. **Create and Configure the Substore in nopCommerce**  
4. **Create the User Account(s) for the Client**

---

## 4. Create Client (Dropbox) Folder

This prepares the **per-client storage** in Dropbox.

- Read **App Key** and **App Secret** from Dropbox Developers.  
- Set redirect URIs.  
- Folder path: `Dropbox\Cadify\Apps\<ClientFolder>`

### 4.1 Create the Dropbox App

Steps:

1. Log in: https://www.dropbox.com/developers  
2. Open **App Console**  
3. Create new app (this creates the App Folder)

### 4.2 Naming Convention

Must match:

> **Store.Site.Country**  
Example: `Main.Ovalas.No`

### 4.3 Redirect URIs

Main folder redirect URI:

```
Admin/ExtendedStore/AuthorizedAppFolderAuth
```

### 4.4 Permissions

Set Dropbox **app-folder read/write**, restrict to client folder only.

### 4.5 Store App Key and Secret

Save securely for nopCommerce configuration.

---

## 5. Configure Substore in nopCommerce

### 5.1 Create Substore

Path:  
`Administration → Configuration → Stores → Add New`

Store name **must match Dropbox App name**, e.g. `Main.Ovalas.No`.

### 5.2 Connect Dropbox in Cadify Plugin

Enter:

- App Key  
- App Secret  

Then click **Authorize**.

---

## 6. Create a Vendor

Vendor name must **match the Store name** and the **Dropbox App Folder name**.

Used for:

- Permission filtering  
- Store ownership  
- Product assignment

---

## 7. Create User Account (Customer with Vendor Role)

Steps:

1. Register customer  
2. Assign **Vendor role**  
3. Customer becomes Cadify Client admin

Vendor customers can:

- Manage products  
- Sync data with Dropbox  
- Access substore admin panel

---

## 8. Vendor Roles and Permissions

### 8.1 Data Model (Simplified)

**Vendor → Customers (1:N)**  
**Vendor → Products (1:N)**  
**Store → Products (1:N)**  
**Store → Customers (1:N)**

### 8.2 Vendor Role as Permission Filter

Controls:

- Which products a client can see  
- Which customers belong to which client  
- Ensures isolation between clients

### 8.3 Cadify-Specific Structure

The **Store** is the central entity:

- Each Store → One Dropbox Folder  
- Each Store → One Vendor (typical Cadify usage)  
- Each Store → Many Customers  
- Each Vendor → Many Products

---

## 9. Create a Domain Name

In nopCommerce Store settings:

- Set **Store URL** (e.g., `https://main.ovalas.no/`)  
- Enable **SSL**

---

## 10. Configure DNS in ServeTheWorld

Log in:  
https://my.servetheworld.net/login

Set DNS records so:

- Main domain → Server IP  
- Substore domain → Server IP

Allow propagation time.

---

## 11. Install SSL (Let’s Encrypt)

Use **win-acme**:

1. Run as Administrator  
2. Select **IIS**  
3. Pick domain binding  
4. Generate certificate  
5. Auto-install to IIS  

Verify HTTPS works in browser.

---

