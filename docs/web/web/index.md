# Cadify with nopCommerce Web API

This section explains how Cadify connects with nopCommerce using the official Web API. It shows how nopCommerce serves as the backend for commerce operations, while Cadify extends the system with advanced product configuration and production-ready data.

Cadify connects to NopCommerce through the official Web API. NopCommerce manages catalog, pricing, and projects in the backend, while your storefront consumes the APIs. Cadify adds configuration logic and supplies production-ready data directly into the commerce process.

---

## Headless Commerce with nopCommerce

Cadify integrates with nopCommerce through the official Web API, allowing nopCommerce to run purely as a **headless commerce backend**.  
In this setup:

- nopCommerce manages catalog data and customer roles.  
- Your storefront communicates with it through standard REST endpoints.  
- The nopCommerce admin remains the single place to manage products, ensuring familiar workflows for both your team and ours.  

---

## Embedding the Cadify Configurator

Your storefront embeds the **Cadify configurator**, which handles advanced product logic:

- 3D product configuration  
- Dynamic pricing  
- Automated generation of production-ready data  

When a customer completes a configuration, Cadify sends the result as structured attributes or order details via the nopCommerce API.  
The order is then processed using nopCommerce’s built-in workflows, without bypassing security or compliance features.

---

## Separation of Concerns

This architecture separates responsibilities clearly:

- The **storefront** can be built with any modern framework such as React, Angular, or Vue.  
- **nopCommerce** provides a stable, PCI-compliant backend with full B2B capabilities.  
- **Cadify** adds the intelligence layer that transforms complex input into manufacturable products.  

All integration happens through supported API surfaces, making the system **upgrade-safe, scalable, and aligned with best practices**.