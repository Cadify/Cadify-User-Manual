# Cadify Terminology & Store Relationships

## 1. Terminology

### Silo (Cadify Client)
A **Cadify customer** that owns a store and its products.

- Previously called **Store Owner** (this term is deprecated).
- A **Cadify Client** can be either:
  - a **Company**, or
  - a **Marketplace**.

### Cadify Store
A **nopCommerce Store** that belongs to a **Cadify Client**.

- Each **Cadify Store**:
  - corresponds to a specific **Cadify Client**
  - is connected to **exactly one** **Dropbox App Folder**

### Dropbox App Folder
A dedicated Dropbox application folder used to store the **Cadify Client’s product files**.

- Has restricted access and cannot see any other client’s folders.
- Example path:

  `Dropbox\Cadify\Apps\<ClientFolder>`

### Cadify Authorization
The mechanism that connects a specific **Cadify Store** in **nopCommerce** to a specific **Dropbox App Folder**.

- The relationship is **1:1**:
  - **One Store ↔ One Dropbox App Folder**

### Site vs Store
- **Site** example: `ovalas.no`
- A **Site** can host multiple **Stores**, for example:
  - `main.ovalas.no`
  - `anotherstore.ovalas.no`

---

## 2. Silo and Store Role Relationship

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/silos.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

In **nopCommerce**, a **Cadify Client** is represented as a **Customer** with the **Store role**. In this document, **“Vendor”** refers to this nopCommerce concept.

A **customer with the Store role** can log in to the corresponding **Cadify add-in** and its corresponding **service**. From the add-in, the user can **publish** content to the **site**. In the background, the service **supports the site** so the user can use the full environment, such as **calculations**, **requesting quotes**, and **downloading models**.

### Key points
- A **Silo (Cadify Client)** must have:
  - a **nopCommerce Store (Cadify Store)**, and
  - a connected **Dropbox App Folder** via **Cadify Authorization**
- While **nopCommerce** allows:
  - **One Store → Store Role**  
  Cadify currently uses a simplified structure where:
  - **One Store** effectively represents **one Silo (Cadify Client)** and **one Store role**
  - however, a specific customer can have **multiple Store Role**
- A **Site** (e.g. `ovalas.no`) can contain multiple **Stores (subsites)**, each connected to its own **Dropbox App Folder**
