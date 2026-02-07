<script lang="ts">
	import favicon from '$lib/assets/favicon.svg';
	import { scale } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';
  import { page } from '$app/stores'; // Import page store

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<div class="page-transition-container">
  {#key $page.url.pathname}
    <div
      in:scale={{ duration: 500, start: 0.8, easing: quintOut }} // Removed opacity: 0 from start
      out:scale={{ duration: 500, to: 1.2, opacity: 0, easing: quintOut }}
      style="transform-origin: center center; position: absolute; width: 100%; height: 100%;"
    >
      {@render children()}
    </div>
  {/key}
</div>

<style>
  /* Ensure html and body take full height */
  html, body {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
  }

  /* Global styles for the Judy Hopps repeating background */
  body {
    background-image: url('/images/judy-hopps-bg.jpg');
    background-repeat: repeat;
    background-size: 100px 100px; /* Adjust this to make the repeating image smaller or larger */
    background-attachment: fixed; /* Keeps background fixed when scrolling */
  }

  .page-transition-container {
    position: relative;
    width: 100%;
    height: 100%;
    overflow: hidden; /* Hide overflowing parts of the transition */
  }
</style>
