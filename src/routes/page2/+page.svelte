<script lang="ts">
	import ImageSelection from '$lib/components/ImageSelection.svelte';

	const question = 'Which one captures our most memorable adventure?';
	const images = [
		'/images/page2/img1-correct.jpg',
		'/images/page2/img2-wrong.jpg',
		'/images/page2/img3-wrong.jpg',
		'/images/page2/img4-wrong.jpg',
		'/images/page2/img5-wrong.jpg',
		'/images/page2/img6-wrong.jpg'
	];
	const correctImageIndex = 0; // This is arbitrary, you'll change it
	const nextPagePath = '/page3';
</script>

<ImageSelection {question} {images} {correctImageIndex} {nextPagePath} />
