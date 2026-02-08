<script lang="ts">
	import ImageSelection from '$lib/components/ImageSelection.svelte';

	const question = 'Which one reminds you of our first date?';
	const images = [
		'/images/page1/img1-wrong.svg',
		'/images/page1/img2-wrong.svg',
		'/images/page1/img3-correct.svg',
		'/images/page1/img4-wrong.svg',
		'/images/page1/img5-wrong.svg',
		'/images/page1/img6-wrong.svg'
	];
	const correctImageIndex = 2; // This is arbitrary, you'll change it
	const nextPagePath = '/page2';
</script>

<ImageSelection {question} {images} {correctImageIndex} {nextPagePath} />
