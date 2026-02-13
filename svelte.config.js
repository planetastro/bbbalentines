import adapter from '@sveltejs/adapter-static';

/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    adapter: adapter({
      pages: 'build',
      assets: 'build',
      fallback: '404.html',
      precompress: false,
      strict: true,
    }),
    paths: {
      base: process.env.NODE_ENV === 'production' ? (process.env.BASE_PATH || '/bbbalentines') : ''
    }
  }
};

export default config;

/**
 * NOTE ON ASSETS & NAVIGATION:
 * When adding new images or using `goto()`, you MUST prefix the path with `base` from `$app/paths`.
 * 
 * Example for images: 
 *   import { base } from '$app/paths';
 *   <img src="{base}/images/my-image.jpg" />
 * 
 * Example for navigation: 
 *   goto(`${base}/my-page`);
 * 
 * This ensures the app works correctly both locally and when deployed to a GitHub Pages subpath.
 */
