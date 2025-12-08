# CMS Store Front

## Overview

Cadify supports the use of an external CMS as your public-facing website.  
The CMS becomes the entry point on your main domain, while the Cadify Store continues to run on its dedicated address. This separates content management from configuration without changing how Cadify operates.

---

## How It Works

Your main domain (for example `yourcompany.no`) points to the CMS.  
Your Cadify Store remains available on a subdomain such as:

- `store.yourcompany.no`
- `config.yourcompany.no`

The CMS handles content and navigation.  
Cadify handles configuration, RFQ, and customer projects.

No changes are required inside Cadify.

---

## User Flow

1. Users enter your main domain and browse CMS content.  
2. They follow a link to the Cadify Store when they are ready to configure a product or access their project.  
3. The Store opens with full functionality and your branding.

Navigation is handled with standard hyperlinks.

---

## Connecting CMS and Cadify

Your CMS can link directly to Cadify using URLs such as:

- **Configure product** → `https://store.yourcompany.no`  
- **Customer login** → `https://store.yourcompany.no/customer/info`  
- **Projects** → `https://store.yourcompany.no/projects`

The CMS manages presentation; Cadify manages all configuration logic.

---

## Technical Note for System Administrators

To use a CMS Store Front, point the **root A record** of your domain to the CMS server.  
Keep Cadify Stores on their existing hosting environment by assigning **subdomains** (for example `store.yourcompany.no`) to the Cadify server.  
Ensure SSL certificates are valid for both the main domain (CMS) and the subdomain (Cadify). No further integration is required.

---

## Summary

A CMS Store Front provides editorial flexibility on the main domain while keeping Cadify’s configuration environment unchanged. The setup is simple: CMS for your public pages, Cadify for all product and project work.