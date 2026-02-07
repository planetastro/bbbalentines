<script lang="ts">
  import ImageSelection from '$lib/components/ImageSelection.svelte';

  const question = "Which one captures our most memorable adventure?";
  const images = [
    '/images/placeholder-page2-img1.svg',
    '/images/placeholder-page2-img2.svg',
    '/images/placeholder-page2-img3.svg',
    '/images/placeholder-page2-img4.svg',
    '/images/placeholder-page2-img5.svg',
    '/images/placeholder-page2-img6.svg',
  ];
  const correctImageIndex = 0; // This is arbitrary, you'll change it
  const nextPagePath = '/page3';
</script>

<ImageSelection {question} {images} {correctImageIndex} {nextPagePath} />
