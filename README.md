# 📘 Cadify User Manual

This repository is hosted as a GitHub Pages site:  
👉 [Open Cadify User Manual](https://cadify.github.io/Cadify-User-Manual/)

## Development

The manual can be served for development either via its container or with mkdocs installed locally.

### Container

1. Install Docker or Podman and make sure it works.
2. Install Docker Compose.
3. Run the container with `docker compose up -d`.
4. The manual will be available at `http://localhost:8000`.

### Mkdocs

1. Install Python 3 and make sure it works.
2. Install the dependencies in `requirements.txt`. Watch out for the correct version of `mkdocs-material` as hot reload may not work in newer versions.
3. Start the development server with `mkdocs serve`.
4. The manual will be available at `http://localhost:8000`.

# Bilingual search index (NO + EN) for CMS (WordPress)

Our product manual is built with MkDocs and consumed from CMS (WordPress, etc). We want users to be able to search in Norwegian or English without selecting a language, while keeping all search behavior in the docs pipeline (not in the CMS).

On every commit, our GitHub Actions workflow builds the MkDocs site and then post-processes the generated site/search/search_index.json before deploying to GitHub Pages. The post-processing step parses the JSON, iterates over docs[], and expands the searchable content (typically docs[i].text) by appending a derived “bilingual search text” string.

The derived text is created by normalizing the original content (lowercasing and folding/handling æ/ø/å variants) and applying a controlled NO↔EN terminology/synonym expansion for our product vocabulary. The modified JSON is written back to site/search/search_index.json and deployed as part of the site, so CMS can continue to fetch() a single index URL and run its existing search UI against docs[].text.

# WordPress Search Integration for Cadify User Manual

## Search Index Source

We will use the MkDocs-generated search index directly from:

https://cadify.github.io/Cadify-User-Manual/search/search_index.json

This file is automatically rebuilt and deployed on every commit. It contains a bilingual search index (Norwegian + English), meaning the searchable text has already been expanded in the docs pipeline to support both languages. WordPress does not need to handle any language logic.

---

## What You Need to Implement in WordPress

Create a small JavaScript-based search component that:

- Uses `fetch()` to load the JSON from the URL above.
- Reads the `docs[]` array in the response.
- Searches within:
  - `title`
  - `text`
  - `location`
- Renders results as clickable links using `location`.

When rendering links, prepend the base URL if needed:

```https://cadify.github.io/Cadify-User-Manual/```

Example final link format:

```https://cadify.github.io/Cadify-User-Manual/<location>```

---

## Important Notes

- Do not import or duplicate the manual into WordPress.
- Always fetch the live `search_index.json` so the search stays automatically in sync with the docs build.
- Cache the JSON in the browser or via CDN for performance.
- If CORS blocks the request in production, create a simple WordPress proxy endpoint (same domain) that fetches the JSON server-side and returns it to the frontend.

That is all that is required. WordPress only consumes the index and renders the results; all search intelligence and bilingual handling is already implemented in the MkDocs build.