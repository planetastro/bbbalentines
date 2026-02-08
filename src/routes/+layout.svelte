<script lang="ts">
	import favicon from '$lib/assets/favicon.svg';
	import { scale } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';
  import { page } from '$app/stores'; // Import page store

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
  <title>Will you be my...</title>
</svelte:head>

<div class="page-transition-container">
  {#key $page.url.pathname}
    <div
      in:scale={{ duration: 500, start: 0.8, easing: quintOut }}
      out:scale={{ duration: 500, to: 1.2, opacity: 0, easing: quintOut }}
      style="transform-origin: center center; position: absolute; width: 100%; height: 100%;"
    >
      {@render children()}
    </div>
  {/key}
</div>

<style>
  /* Ensure html and body take full height */
  :global(html), :global(body) {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
  }

  .page-transition-container {
    position: relative;
    width: 100%;
    min-height: 100dvh; /* Use dynamic viewport height for better mobile support */
    display: flex;
    flex-direction: column;

    /* Global styles for the Usagi repeating background */
    background-image: url('/images/usagi-bg.jpg');
    background-repeat: repeat;
    background-size: 10% auto; /* Adjust this to make the repeating image smaller or larger */
    background-attachment: fixed; /* Keeps background fixed when scrolling */
    opacity: 0.75;
  }
</style>
