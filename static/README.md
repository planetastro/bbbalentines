# Static Assets and Base Paths

This directory contains static files served at the root of the application. However, when deploying to platforms like **GitHub Pages** that use subpaths (e.g., `https://username.github.io/project-name/`), standard absolute paths like `/images/pic.jpg` will break (leading to 404 errors) because they point to the domain root instead of the project folder.

## 🛑 The Manual Fix (Current Method)
If you keep assets in this `static/` folder, you **must** manually prefix paths in your code using SvelteKit's `base` helper:

```svelte
<script>
  import { base } from '$app/paths';
</script>

<img src="{base}/images/pic.jpg" />
```

## ✅ The "Pro" Way (Recommended)
To avoid thinking about paths entirely, move your images from `static/images/` to `src/lib/assets/`. 

When you **import** an asset directly into a Svelte component, Vite automatically handles the path logic for you, including adding the correct subpath during deployment.

### How to implement:
1. **Move files**: Move your photos to `/src/lib/assets/`.
2. **Import in Script**:
   ```svelte
   <script>
     import myPhoto from '$lib/assets/my-photo.jpg';
   </script>
   ```
3. **Use directly**:
   ```svelte
   <img src={myPhoto} alt="Correctly resolved path" />
   ```

### Why use the Asset folder?
- **Automatic Pathing**: No need for `{base}`.
- **Cache Busting**: Vite adds a unique hash to the filename so users always see the latest version after an update.
- **Build-time Validation**: If you move or delete the image, the build will fail immediately instead of showing a broken link to users.
