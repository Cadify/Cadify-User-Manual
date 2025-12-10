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

This distinction is important when you work with **multiple subsites under the same domain or hosting environment**.

Site example: `ovalas.no`

A **Site** can host **multiple Stores**, for example:

- `main.ovalas.no`  
- `anotherstore.ovalas.no`

---

## 2. Vendor Role and Entity Relationships

This section explains how **Vendors, Stores, Customers and Products** relate to each other in nopCommerce and how Cadify uses these relations to **enforce permissions**.

In nopCommerce, a **Cadify Client is represented as a Customer with the Vendor role**.  
In this document, **“Vendor” refers to this nopCommerce concept.**

**Key points:**

A Cadify Client must have:

- a **nopCommerce Store (Cadify Store)**, and  
- a **connected Dropbox App Folder via Cadify Authorization**.

While nopCommerce allows:

- **One Store → Many Vendors**,  

Cadify currently uses a simplified structure where:

> **One Store effectively represents one Cadify Client and one Vendor.**

A Site (e.g. `ovalas.no`) can contain **multiple Stores (subsites)**, each connected to its own **Dropbox App Folder**.

---

## 3. Client Onboarding Process (High-Level)

This section gives you a **bird’s-eye view** of the onboarding steps.  
Use it as a **checklist** before you dive into the detailed instructions.

The full process of setting up a **new Cadify Client** has **four main steps**:

1. **Create the Client’s Dropbox App Folder**  
   Done via **Dropbox Developers** console.

2. **Create the Cadify Client & Vendor in nopCommerce**  
   Set up the **nopCommerce customer with Vendor role**.

3. **Create and Configure the Substore in nopCommerce**  
   Create the **Store** and configure the **Cadify plugin** with Dropbox app credentials.

4. **Create the User Account(s) for the Client**  
   Register customer accounts and **associate them with the Vendor role** to access and manage products.

> **Details for each step follow.**

---

## 4. Create Client (Dropbox) Folder

In this step you prepare the **per-client storage in Dropbox**.  
This folder will later be linked to the **nopCommerce Store via Cadify Authorization**.

- **Read App key and app secret** of the main folder and set Redirect URIs.  
- The redirect URI for main folder is:  
  `Admin/CadifyConfiguration/AuthorizedAppFolder`

Cadify products are stored in **per-client Dropbox folders**:

`Dropbox\Cadify\Apps\<ClientFolder>`

### 4.1 Create the Dropbox App (Client Folder)

1. Log in to **Dropbox Developers**:  
   https://www.dropbox.com/developers  

2. Open the **App Console**.  
3. **Create a new Dropbox App.**

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_login.png" alt="Dropbox Login" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

Creating an app **automatically creates a corresponding App Folder**.

- This folder will become the **Client Folder for the new Cadify Store**.  
- The app represents a folder under `C:\Dropbox\Cadify\Apps\`.  
- This new app folder will be the **store of the new site**.  
- Dropbox **App key and secret** can be found at `dropbox.com/developers`.

> ⚠️ **This is a sensitive step.** You must be careful when creating and configuring apps, because **any mistake here will affect file access for that client.**

### 4.2 Naming Convention

**Consistent naming** ensures that **Dropbox, nopCommerce, and Cadify** all point to the **same logical client**.

The Dropbox app name (and thus folder name) must follow this convention:

> **Store.Site.Country**

Example:

> `Main.Ovalas.No`

This name must **exactly match** the **nopCommerce Substore name** that will be created later.

### 4.3 Redirect URIs

Redirect URIs connect **Dropbox OAuth** back to the **correct Cadify instance**.  
If they are wrong, **authorization will fail**.

Each Dropbox app must have a **Redirect URI** pointing back to the site’s **authorization endpoint**.  
That points to the new site’s `AuthorizeAppFolderAuth` function.

For the **main folder (global app)**, the Redirect URI is:

```text
Admin/ExtendedStore/AuthorizedAppFolderAuth