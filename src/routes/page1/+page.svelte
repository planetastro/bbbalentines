<script lang="ts">
	import ImageSelection from '$lib/components/ImageSelection.svelte';

	const question = 'Which wallpaper is my favourite?';
	const images = [
		'/images/page1/img1-wrong.jpg',
		'/images/page1/img2-wrong.jpg',
		'/images/page1/img3-correct.jpg',
		'/images/page1/img4-wrong.jpg',
		'/images/page1/img5-wrong.jpg',
		'/images/page1/img6-wrong.jpg'
	];
	const correctImageIndex = 2; // This is arbitrary, you'll change it
	const nextPagePath = '/page2';
</script>

<ImageSelection {question} {images} {correctImageIndex} {nextPagePath} />
