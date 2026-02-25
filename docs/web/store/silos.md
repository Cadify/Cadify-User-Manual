# Cadify Terminology 

# Silo and Store Role Relationship

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/silos.png" style="max-width:100%; border:1px solid #ccc; border-radius:6px;">

In **nopCommerce**, a **Cadify Client** is represented as a **Customer** with the **Store role**. In this document, **“Vendor”** refers to this nopCommerce concept.

A **customer with the Store role** can log in to the corresponding **Cadify add-in** and its corresponding **service**. From the add-in, the user can **publish** content to the **site**. In the background, the service **supports the site** so the user can use the full environment, such as **calculations**, **requesting quotes**, and **downloading models**.

### Key points
- A **Silo (Cadify Client)** must have:
  - a **nopCommerce Store (Cadify Store)**, and
  - a connected **Cadify Cloud workspace** via **Cadify Authorization**
- While **nopCommerce** allows:
  - **One Store → Store Role**  
  Cadify currently uses a simplified structure where:
  - **One Store** effectively represents **one Silo (Cadify Client)** and **one Store role**
  - however, a specific customer can have **multiple Store Role**
- A **Site** (e.g. `ovalas.no`) can contain multiple **Stores (subsites)**, each connected to its own **Cadify Cloud workspace**
