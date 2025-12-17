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
