Cadify Substore System

Technical Overview  
This document describes the full end-to-end setup of a Cadify Substore, from Dropbox configuration through nopCommerce setup to domain and SSL configuration. Follow the sections in order when onboarding a new Cadify Client.

1. Terminology  
This section defines the key concepts (Client, Vendor, Store, etc.) that are used throughout the rest of the guide. Make sure these are clear before you start the technical steps.

Cadify Client  
A Cadify customer that owns a store and its products.

Previously called Store Owner (this term is deprecated).

A Cadify Client can be either:

a Company, or

a Marketplace.

Vendor (nopCommerce term)  
A Vendor is a nopCommerce user type used to manage store-specific admin pages.

Technically: a Customer with Vendor role in nopCommerce.

In Cadify:

A Cadify Client is represented as a Vendor in nopCommerce so they can manage their store.

The term Vendor is only used in the nopCommerce context.

Cadify Store  
A nopCommerce Store that belongs to a Cadify Client.

Each Cadify Store:

Corresponds to a specific Cadify Client.

Is connected to exactly one Dropbox App Folder.

Dropbox App Folder  
A dedicated Dropbox application folder used to store the Cadify Client’s product files.

It has restricted access and cannot see any other client’s folders.

Example path:  
Dropbox\Cadify\Apps\<ClientFolder>

Cadify Authorization  
The mechanism that connects a specific Cadify Store in nopCommerce to a specific Dropbox App Folder.

The relationship is 1:1:

One Store ↔ One Dropbox App Folder

Site vs Store  
This distinction is important when you work with multiple subsites under the same domain or hosting environment.

Site example: ovalas.no

A Site can host multiple Stores, for example:

main.ovalas.no

anotherstore.ovalas.no

2. Vendor Role and Entity Relationships  
This section explains how Vendors, Stores, Customers and Products relate to each other in nopCommerce and how Cadify uses these relations to enforce permissions.

In nopCommerce, a Cadify Client is represented as a Customer with the Vendor role. In this document, “Vendor” refers to this nopCommerce concept.

Key points:

A Cadify Client must have:

A nopCommerce Store (Cadify Store), and

A connected Dropbox App Folder via Cadify Authorization.

While nopCommerce allows:

One Store → Many Vendors,  
Cadify currently uses a simplified structure where:

One Store effectively represents one Cadify Client and one Vendor.

A Site (e.g. ovalas.no) can contain multiple Stores (subsites), each connected to its own Dropbox App Folder.

3. Client Onboarding Process (High-Level)  
This section gives you a bird’s-eye view of the onboarding steps. Use it as a checklist before you dive into the detailed instructions.

The full process of setting up a new Cadify Client has four main steps:

Create the Client’s Dropbox App Folder  
Done via Dropbox Developers console.

Create the Cadify Client & Vendor in nopCommerce  
Set up the nopCommerce customer with Vendor role.

Create and Configure the Substore in nopCommerce  
Create the Store and configure the Cadify plugin with Dropbox app credentials.

Create the User Account(s) for the Client  
Register customer accounts and associate them with the Vendor role to access and manage products.

Details for each step follow.

4. Create Client (Dropbox) Folder  
In this step you prepare the per-client storage in Dropbox. This folder will later be linked to the nopCommerce Store via Cadify Authorization.

Read App key and app secret of the main folder and set Redirects URIs

The redirect URI for main folder is Admin/CadifyConfiguration/AuthorizedAppFolder

Cadify products are stored in per-client Dropbox folders:

Dropbox\Cadify\Apps\<ClientFolder>

4.1. Create the Dropbox App (Client Folder)

Log in to Dropbox Developers:  
https://www.dropbox.com/developers

Open the App Console.

Create a new Dropbox App.

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_login.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

Creating an app automatically creates a corresponding App Folder.

This folder will become the Client Folder for the new Cadify Store.

The app represents a folder under C:\Dropbox\Cadify\Apps\. This new app folder will be the store of the new site. Dropbox App key and secret can be found at dropbox.com/developers.

⚠️ This is a sensitive step. You must be careful when creating and configuring apps, because any mistake here will affect file access for that client.

4.2. Naming Convention  
Consistent naming ensures that Dropbox, nopCommerce, and Cadify all point to the same logical client.

The Dropbox app name (and thus folder name) must follow this convention:

Store.Site.Country

Example:

Main.Ovalas.No

This name must exactly match the nopCommerce Substore name that will be created later.

4.3. Redirect URIs  
Redirect URIs connect Dropbox OAuth back to the correct Cadify instance. If they are wrong, authorization will fail.

Each Dropbox app must have a Redirect URI pointing back to the site’s authorization endpoint. That points to the new site’s `AuthorizeAppFolderAuth` function.

For the main folder (global app), the Redirect URI is:

`Admin/ExtendedStore/AuthorizedAppFolderAuth`

For each client app, add its Redirect URI to the Dropbox app’s settings, matching the site’s Cadify configuration for “Authorize App Folder”.

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_redirect_uri.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

4.4. Permissions  
Permissions control what the Cadify app is allowed to do inside the client’s Dropbox folder.

On the Permissions tab of the Dropbox app:

Configure the required permissions (for example, app-folder–level read/write) according to Cadify’s security and data access requirements.

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_permissions_1.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

On the permission tab of the app folder the different permissions must be set so that Cadify can upload, update and read product files, but cannot access other unrelated areas of the user’s Dropbox.

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_permissions_2.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

4.5. Copy and store App key and app secret of the main folder  
You will need the App key and App secret later when configuring the store in nopCommerce, so store them in a secure but accessible place (for example, a password manager or secure config store).

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/dropbox_setups.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

5. Configure Substore in nopCommerce  
Here you create the nopCommerce Store that represents the client and link it to the Dropbox App you created in the previous step.

5.1. Create the Substore

Path:  
nopCommerce → Administration → Configuration → Stores → Add New

Create a new Store.

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/create_new_substore.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

The Store name must be identical to the Dropbox App Folder name:

e.g. Main.Ovalas.No.

Set a language in the default store (choose one), making sure it matches the expected language for the client’s site.

5.2. Set Store’s Dropbox Folder in the Cadify Plugin  
In this step you enter the Dropbox credentials so Cadify can access the client’s files.

Path:  
Administration → Configuration → Stores

Open the Cadify configuration for the Store.

Enter the Dropbox App Key and App Secret obtained from Dropbox Developers for Main.Ovalas.No.

Click **Authorize** to connect the Store to the Dropbox App Folder.

This step establishes Cadify Authorization between the Store and the Dropbox folder. If authorization fails, double-check the app key/secret and Redirect URI settings.

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/substore_dropbox_connection.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

6. Create a Vendor  
The Vendor entity represents the Cadify Client inside nopCommerce and links the Store to the right customers and products.

Vendors are created via the nopCommerce Administration interface.

Go to the **Vendors** section in the Admin area.

Create a new Vendor.

The Vendor name must be identical to:

the Substore name, and

the Dropbox App Folder name (for example, Main.Ovalas.No).

This Vendor will represent the Cadify Client for that Store and will be used for permission filtering and product ownership.

7. Create an Account (Customer with Vendor Role)  
Now you create the actual user accounts that the client’s admins will use to log in and manage their products.

The last step is to create the actual user account(s) for the Cadify Client.

A Vendor can have multiple registered customers.

A customer registers via the standard nopCommerce registration system.

In the customer’s admin profile:

Assign the Vendor (Vendor Role) to associate the customer with the Vendor.

Result:

This customer now acts as the Cadify Client admin for that Store.

With Vendor rights, they can:

Manage products for their Store.

Upload and manage product data synchronized with their Dropbox folder.

8. Connecting Products and Customers via Vendor Roles  
This section explains how the underlying nopCommerce data model uses Vendors to tie together customers, products and stores for permission control.

8.1. nopCommerce Data Model (Simplified)

In nopCommerce:

Vendors are special entities used to control product- and store-level permissions.

A Vendor is not the same as a general Role; it’s a separate concept.

Key relationships:

Vendor → Customers  
One Vendor → Many Customers (1:N)

Vendor → Products  
One Vendor → Many Products (1:N)

Thus, a Vendor can:

Represent a Cadify Client, and

Control which Products and Customers belong together.

Stores and Products are also connected through many-to-many relations in nopCommerce, but this does not by itself define permissions. Permissions are mainly enforced via the Vendor associations.

8.2. Vendor Role as Permission Filter

The Vendor Role is the main link between:

Customers

Products

Stores

It allows nopCommerce (and thus Cadify) to:

Filter which customers can see and manage which product tabs/options.

Limit product management to the correct client’s Store so that clients never see or edit each other’s data.

8.3. Cadify-Specific Structure

In the Cadify System:

The central table is Stores.

A Store represents a Cadify Client.

Each Cadify Client has one Dropbox App Folder.

A Cadify Client can be:

a Company, or

a Cadify Marketplace.

Regardless of type:

Store → Vendors: One Store → Many Vendors (but typically one Vendor per Store in Cadify’s current usage).

Store → Customers: One Store → Many Customers.

Store → Products: One Store → Many Products.

Vendor → Products: One Vendor → Many Products (optional, but used for permission control).

This model allows:

Clear mapping of products and customers to the correct client Store.

Secure file storage per client via Dropbox App Folders.

Fine-grained permissions using Vendor-based filtering in nopCommerce.


9. Create a domain name  
In this step you configure the public domain that customers will use to access the new substore. The domain must point to the correct server and support HTTPS.

Set the domain name for store url, SSL must be enabled.  
In nopCommerce, open the Store configuration and:

- Set the **Store URL** to the desired domain (for example, `https://main.ovalas.no/`).  
- Ensure **SSL enabled** is turned on so all traffic is served via HTTPS.

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/create_new_substore.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

Set the binding in the IIS  
Now you tell IIS which domain it should respond to for this nopCommerce instance.

Set the binding in the proper IIS in the given nopCommerce. Edit bindings of the nopCommerce web app. The web app name can be anything but it must contain the nopCommerce app. In this example **Cadify2** is a nopCommerce app.

Steps (on the IIS server):

1. Open **IIS Manager**.  
2. Locate the site hosting the nopCommerce application (e.g. *nopCommerce*).  
3. Click **Bindings…** on the right-hand side.  
4. Edit existing bindings if necessary, or add a new one for the new domain.


 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/edit
 _IIS_binding.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

Add new binding. Set the new domain name for the host name. Set the port for 443. Set **Require Server Name Indication**.  
Make sure you select the correct SSL certificate once it is created (see the Let’s Encrypt step later). This allows IIS to serve the site securely under the new domain.

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/set_IIS_binding.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

10. Connect the store with domain name in ServeTheWorld  
Now you configure DNS so that the public domain points to the server where IIS and nopCommerce are running.

Log in to the hosting control panel:

https://my.servetheworld.net/login

my.servetheworld.net

Products -> HTS-LRG (Web Hosting)

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/STW_products_hst_lrg.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

Product Details -> DNS Settings

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/STW_products_dns_settings.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

Domain Aliases -> DNS Settings -> Select specific site

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/STW_products_details.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

Set the important main DNS settings  
Configure the necessary DNS records (typically **A** or **CNAME** records) so that:

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/STW_set_important_dns
.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

- The main domain points to the server IP (e.g. `ovalas.no` → server IP).  
- Any required substore domains (e.g. `main.ovalas.no`) also point to the correct IP.

And the substore  
Add an additional DNS entry for the substore hostname if it differs from the main domain. Once DNS is saved, allow some time for propagation before testing in the browser.

11. Let’s Encrypt  
In this final step you request and install a free SSL certificate so the domain can be accessed securely via HTTPS.

Wait a few minutes after domain name registration.  
The DNS changes must be fully propagated before Let’s Encrypt can validate the domain.

Download https://www.win-acme.com/ on the machine where IIS runs.  
**win-acme** is a Windows ACME client that automates issuing and installing Let's Encrypt certificates.

On Ovalas.no  
At ovalas.no start **Command Prompt** (as Administrator).

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/letsencrypt_1.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

Run the win-acme client and follow the interactive prompts:

- Select **IIS** as the target.  
- Choose the site or binding that corresponds to your new domain.  
- Let the tool create and install the certificate automatically.  

Always use the default answer except that the **main host** must be set to `ovalas.no`.  
After completion, verify in IIS that the new certificate is bound to port 443 for the new domain, and then test `https://<your-domain>` in a browser.

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/letsencrypt_2.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

 <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/web/store/images/letsencrypt_3.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

