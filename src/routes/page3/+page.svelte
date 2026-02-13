<script lang="ts">
	import ImageSelection from '$lib/components/ImageSelection.svelte';

	const question = 'Which one shows how much you mean to me?';
	const images = [
		'/images/page3/img1-wrong.jpg',
		'/images/page3/img2-wrong.jpg',
		'/images/page3/img3-wrong.jpg',
		'/images/page3/img4-wrong.jpg',
		'/images/page3/img5-correct.jpg',
		'/images/page3/img6-wrong.jpg'
	];
	const correctImageIndex = 4; // This is arbitrary, you'll change it
	const nextPagePath = '/completion';
</script>

<ImageSelection {question} {images} {correctImageIndex} {nextPagePath} />
