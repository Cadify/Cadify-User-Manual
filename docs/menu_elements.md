# menu_elements.md

# Task Pane & CadifyLightMenu

The Task Pane is the main user interface for the Cadify Light Excel Add-in.  

## Main Menu Structure

### File Menu

- **Open Raw**  
  Open a raw product from Dropbox.  
  *Enabled only if a user is logged in and no product is currently open.*

- **Open Published**  
  Open a published product from Dropbox.  
  *Enabled only if a user is logged in and no product is currently open.*

- **Save**  
  Save the current product to local and cloud storage.  
  *Enabled only if a product is open.*

- **Save as (Raw)**  
  Create first raw if no product is currently open. Save a copy of the current product as a new raw product.

- **Publish**  
  Publish or republish the current product to the cloud.  
  *Button label changes based on product type. Enabled only if a product is open.*

- **Delete Raw(s)**  
  Delete one or more raw products from Dropbox.

- **Close**  
  Close the current product, with options to save changes.  
  *Enabled only if a product is open.*

### Tools Menu

- **General Information**  
  Edit general product attributes (e.g., name, SKU).  
  *Enabled only if a product is open.*

### User Profile

- **Login**  
  Open login dialog.  
  *Visible only if no user is logged in.*

- **[User Name]**  
  A button shows current user's name, with Logout sub menu option.
  - **Logout**: Log out and clear credentials.

---

## Visual and Interactive Features

- **Dynamic Colors**:  
  Menu backgrounds and text colors adapt to the current theme.
- **Disabled State**:  
  Disabled items are grayed out.

---