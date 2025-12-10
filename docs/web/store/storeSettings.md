# Cadify Substore System

## Technical Overview  
This document describes the full end-to-end setup of a Cadify Substore, from Dropbox configuration through nopCommerce setup to domain and SSL configuration. Follow the sections in order when onboarding a new Cadify Client.

---

## 1. Terminology  
This section defines the key concepts (Client, Vendor, Store, etc.) that are used throughout the rest of the guide. Make sure these are clear before you start the technical steps.

### Cadify Client  
A Cadify customer that owns a store and its products.  
Previously called Store Owner (this term is deprecated).

A Cadify Client can be either:  
- a Company, or  
- a Marketplace.

### Vendor (nopCommerce term)  
A Vendor is a nopCommerce user type used to manage store-specific admin pages.  
Technically: a Customer with Vendor role in nopCommerce.

In Cadify:  
- A Cadify Client is represented as a Vendor in nopCommerce so they can manage their store.  
- The term Vendor is only used in the nopCommerce context.

### Cadify Store  
A nopCommerce Store that belongs to a Cadify Client.  
Each Cadify Store:  
- Corresponds to a specific Cadify Client.  
- Is connected to exactly one Dropbox App Folder.

### Dropbox App Folder  
A dedicated Dropbox application folder used to store the Cadify Client’s product files.  
It has restricted access and cannot see any other client’s folders.

Example path:  
`Dropbox/Cadify/Apps/<ClientFolder>`

### Cadify Authorization  
The mechanism that connects a specific Cadify Store in nopCommerce to a specific Dropbox App Folder.  
**One Store ↔ One Dropbox App Folder**

### Site vs Store  
A Site (e.g. ovalas.no) can host multiple Stores, such as:  
- main.ovalas.no  
- anotherstore.ovalas.no

---

## 2. Vendor Role and Entity Relationships  

In nopCommerce, a Cadify Client is represented as a Customer with the Vendor role.  
Key points:

A Cadify Client must have:  
- A nopCommerce Store (Cadify Store), and  
- A connected Dropbox App Folder via Cadify Authorization.

While nopCommerce allows:  
- One Store → Many Vendors,  

Cadify uses a simplified structure:  
**One Store represents one Cadify Client and one Vendor.**

A Site can contain multiple Stores, each with its own Dropbox App Folder.

---

## 3. Client Onboarding Process (High-Level)

The full process of setting up a new Cadify Client has four main steps:

1. **Create the Client’s Dropbox App Folder**  
2. **Create the Cadify Client & Vendor in nopCommerce**  
3. **Create and Configure the Substore in nopCommerce**  
4. **Create the User Account(s) for the Client**

---

## 4. Create Client (Dropbox) Folder  

Cadify products are stored in per-client Dropbox folders:  
`Dropbox/Cadify/Apps/<ClientFolder>`

### 4.1 Create the Dropbox App (Client Folder)

Log in to Dropbox Developers:  
https://www.dropbox.com/developers

Open the App Console → Create a new Dropbox App.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_login.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

Creating an app automatically creates the App Folder.

⚠️ Be careful when creating apps. Mistakes affect file access.

### 4.2 Naming Convention  
Use naming:  
**Store.Site.Country**

Example:  
`Main.Ovalas.No`

Must match the nopCommerce Substore name.

### 4.3 Redirect URIs  
Main folder redirect URI:  
`Admin/ExtendedStore/AuthorizedAppFolderAuth`

Each client app must include its corresponding redirect URI.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_redirect_uri.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

### 4.4 Permissions  

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_permissions_1.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_permissions_2.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

Set permissions so Cadify can upload/update/read files but cannot access unrelated folders.

### 4.5 Store App Key and Secret  

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_setups.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

---

## 5. Configure Substore in nopCommerce  

### 5.1 Create the Substore  
Path: Administration → Configuration → Stores → Add New

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/create_new_substore.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

The Store name must match the Dropbox App Folder name.

### 5.2 Configure Dropbox in Cadify Plugin  

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/substore_dropbox_connection.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

Enter App Key & Secret → Click **Authorize**

---

## 6. Create a Vendor  

Vendor name must match:  
- Substore name  
- Dropbox folder name  

Represents the client and controls permissions.

---

## 7. Create an Account (Customer with Vendor Role)

Steps:  
1. Register customer  
2. Assign Vendor role  
3. Customer becomes client admin

They can manage products and sync Dropbox data.

---

## 8. Vendor Roles & Permissions  

### 8.1 Data Model  
Vendor → Customers (1:N)  
Vendor → Products (1:N)

### 8.2 Vendor as Permission Filter  
Ensures isolation between clients.

### 8.3 Cadify Structure  
Store is the central object mapping customers, products, and Dropbox folders.

---

## 9. Create a Domain Name  

In Store settings:  
- Set Store URL  
- Enable SSL

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/create_new_substore.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

---

## 10. DNS Setup in ServeTheWorld  

Login: https://my.servetheworld.net/login

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/STW_products_hst_lrg.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

Navigate to DNS settings.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/STW_products_dns_settings.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

Set A or CNAME records to point domain → server IP.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/STW_set_important_dns.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

---

## 11. Let’s Encrypt SSL  

Use win-acme to generate and install certificate.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/letsencrypt_1.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/letsencrypt_2.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/letsencrypt_3.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

