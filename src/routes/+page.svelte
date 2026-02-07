<script lang="ts">
  import { goto } from '$app/navigation';
  import { onMount } from 'svelte';

  onMount(() => {
    goto('/page1');
  });
</script>

<h1>Loading your Valentine's gift...</h1>
<style>
  h1 {
    text-align: center;
    margin-top: 50px;
    font-family: sans-serif;
    color: #ff69b4;
  }
</style>