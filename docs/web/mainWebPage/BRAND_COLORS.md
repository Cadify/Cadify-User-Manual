# Cadify Brand Color Specifications

This document contains the official Cadify brand colors extracted from logo files for use in the user manual and other documentation.

## Primary Brand Colors

| Name | Hex Code | RGB | Preview | Usage |
|------|----------|-----|---------|-------|
| **Cadify Orange** | `#ef5128` | RGB(239, 81, 40) | ![#ef5128](https://via.placeholder.com/20/ef5128/ef5128.png) | Primary brand color, buttons, links |
| **Orange Light** | `#f37e50` | RGB(243, 126, 80) | ![#f37e50](https://via.placeholder.com/20/f37e50/f37e50.png) | Hover states, highlights |
| **Orange Dark** | `#d94520` | RGB(217, 69, 32) | ![#d94520](https://via.placeholder.com/20/d94520/d94520.png) | Active states, shadows |

## Secondary Colors

| Name | Hex Code | RGB | Preview | Usage |
|------|----------|-----|---------|-------|
| **Light Peach** | `#fcd0b9` | RGB(252, 208, 185) | ![#fcd0b9](https://via.placeholder.com/20/fcd0b9/fcd0b9.png) | Selection highlights, soft backgrounds |
| **Soft Orange** | `#f8a680` | RGB(248, 166, 128) | ![#f8a680](https://via.placeholder.com/20/f8a680/f8a680.png) | Gradients, accents |
| **Cream** | `#fef3ec` | RGB(254, 243, 236) | ![#fef3ec](https://via.placeholder.com/20/fef3ec/fef3ec.png) | Light backgrounds, code blocks |

## Neutral Colors

| Name | Hex Code | RGB | Preview | Usage |
|------|----------|-----|---------|-------|
| **Dark** | `#1e1e1e` | RGB(30, 30, 30) | ![#1e1e1e](https://via.placeholder.com/20/1e1e1e/1e1e1e.png) | Text, footer background |
| **Gray** | `#4a4a4a` | RGB(74, 74, 74) | ![#4a4a4a](https://via.placeholder.com/20/4a4a4a/4a4a4a.png) | Secondary text |
| **Light Gray** | `#f5f5f5` | RGB(245, 245, 245) | ![#f5f5f5](https://via.placeholder.com/20/f5f5f5/f5f5f5.png) | Borders, backgrounds |
| **White** | `#ffffff` | RGB(255, 255, 255) | ![#ffffff](https://via.placeholder.com/20/ffffff/ffffff.png) | Primary background |

## Status Colors

| Name | Hex Code | RGB | Preview | Usage |
|------|----------|-----|---------|-------|
| **Success** | `#2e7d32` | RGB(46, 125, 50) | ![#2e7d32](https://via.placeholder.com/20/2e7d32/2e7d32.png) | Success messages, confirmations |
| **Warning** | `#f9a825` | RGB(249, 168, 37) | ![#f9a825](https://via.placeholder.com/20/f9a825/f9a825.png) | Warning messages |
| **Error** | `#c62828` | RGB(198, 40, 40) | ![#c62828](https://via.placeholder.com/20/c62828/c62828.png) | Error messages |
| **Info** | `#1565c0` | RGB(21, 101, 192) | ![#1565c0](https://via.placeholder.com/20/1565c0/1565c0.png) | Information callouts |

## CSS Variables

Use these CSS custom properties in your stylesheets:

```css
:root {
  /* Primary Cadify Colors */
  --cadify-primary: #ef5128;
  --cadify-primary-light: #f37e50;
  --cadify-primary-dark: #d94520;
  
  /* Secondary Colors */
  --cadify-peach: #fcd0b9;
  --cadify-soft-orange: #f8a680;
  --cadify-cream: #fef3ec;
  
  /* Neutral Colors */
  --cadify-dark: #1e1e1e;
  --cadify-gray: #4a4a4a;
  --cadify-light-gray: #f5f5f5;
  --cadify-white: #ffffff;
}
```

## Logo Files

The following logo files are available in the repository:

### PNG Format
- `docs/web/mainWebPage/logo/png/logo_ikon.png` - Icon only
- `docs/web/mainWebPage/logo/png/logo_logo_hoved.png` - Main logo
- `docs/web/mainWebPage/logo/png/logo_logo_oransje.png` - Orange logo

### PDF Format
- `docs/web/mainWebPage/logo/pdf/ikon.pdf` - Icon only
- `docs/web/mainWebPage/logo/pdf/logo_hoved.pdf` - Main logo
- `docs/web/mainWebPage/logo/pdf/logo_oransje.pdf` - Orange logo

## Typography Recommendations

For the documentation, we recommend:

- **Body Text**: Inter (clean, modern, excellent readability)
- **Code**: JetBrains Mono (designed for code, includes ligatures)
- **Headings**: Inter Bold

## Implementation

The custom theme has been implemented in:
- [docs/stylesheets/cadify-theme.css](docs/stylesheets/cadify-theme.css) - Custom CSS
- [mkdocs.yml](mkdocs.yml) - Theme configuration

### Building the Site

```bash
# Using container
docker compose up -d

# Or using mkdocs directly
mkdocs serve
```

Visit `http://localhost:8000` to see the themed documentation.
