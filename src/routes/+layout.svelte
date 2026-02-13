<script lang="ts">
  import '../app.css';
	import favicon from '$lib/assets/favicon.svg';
	import { scale } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';
  import { page } from '$app/stores'; // Import page store
  import { base } from '$app/paths'; // Import base path

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
  <title>Will you be my...</title>
</svelte:head>

<div class="page-transition-container" style="background-image: url('{base}/images/usagi-bg.jpg');">
  {#key $page.url.pathname}
    <div
      class="transition-wrapper"
      in:scale={{ duration: 500, start: 0.8, easing: quintOut }}
      out:scale={{ duration: 500, to: 1.2, opacity: 0, easing: quintOut }}
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
    display: grid; /* Uses grid to allow overlapping children during transitions */
    grid-template-columns: 100%; /* Ensures children take up the full width */
    grid-template-rows: 100%; /* Ensures children take up the full height */
    width: 100%; /* Fills the horizontal viewport */
    min-height: 100dvh; /* Ensures background covers at least the full viewport height */

    /* Global styles for the Usagi repeating background */
    background-repeat: repeat;
    background-size: 10% auto; /* Adjust this to make the repeating image smaller or larger */
    background-attachment: fixed; /* Keeps background fixed when scrolling */
    opacity: 0.75;
  }

  .transition-wrapper {
    grid-column: 1 / -1; /* Places the child in the first and only grid column */
    grid-row: 1 / -1; /* Places the child in the first and only grid row for overlap */
    width: 100%; /* Fills the container width */
    min-height: 100%; /* Matches the height of the transition container */
    display: flex; /* Allows for flexbox centering within the page */
    flex-direction: column; /* Stacks page content vertically */
    transform-origin: center center; /* Sets pivot for transition animations */
  }
</style>
