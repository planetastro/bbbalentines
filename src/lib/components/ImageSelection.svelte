<script lang="ts">
	import { createEventDispatcher } from 'svelte';
	import { goto } from '$app/navigation'; // Import goto

	export let question: string;
	export let images: string[]; // Array of image paths
	export let correctImageIndex: number; // Index of the correct image for this page
	export let nextPagePath: string; // Path to navigate to on correct selection

	const dispatch = createEventDispatcher();
	let selectedIndex: number | null = null;
	let message: string = '';
	let isCorrectlySelected: boolean = false; // New reactive variable

	async function selectImage(index: number) {
		// Make function async
		selectedIndex = index;
		if (index === correctImageIndex) {
			isCorrectlySelected = true; // Set to true if correct
			message = 'Correct! Navigating to the next page...';
			setTimeout(async () => {
				// Make callback async to await goto
				await goto(nextPagePath); // Use goto for client-side navigation
			}, 1000); // Navigate after a short delay
		} else {
			isCorrectlySelected = false; // Reset if incorrect
			message = 'Oops, try again!';
		}
	}
</script>

<div class="image-selection-container">
	<h1>{question}</h1>
	<div class="image-grid">
		{#each images as image, i}
			<button
				class="image-button"
				class:selected={selectedIndex === i}
				class:correctly-selected={selectedIndex === i && isCorrectlySelected}
				on:click={() => selectImage(i)}
				disabled={selectedIndex !== null && isCorrectlySelected}
			>
				<img src={image} alt={`Choice ${i + 1}`} />
			</button>
		{/each}
	</div>
	{#if message}
		<p class="message">{message}</p>
	{/if}
</div>

<style>
	.image-selection-container {
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 20px;
		font-family: sans-serif;
	}

	h1 {
		color: #ff69b4; /* Hot pink */
		margin-bottom: 30px;
		text-align: center;
		background-color: #fff;
		border-radius: 10px;
		padding: 10px;
	}

	.image-grid {
		display: grid;
		grid-template-columns: repeat(3, 1fr); /* 3 images per row */
		gap: 20px;
		max-width: 900px; /* Limit grid width */
		margin-bottom: 20px;
	}

	.image-button {
		background: none;
		border: 3px solid transparent;
		padding: 5px;
		cursor: pointer;
		transition: all 0.3s ease-in-out; /* Increased transition duration */
		border-radius: 8px;
		overflow: hidden;
		position: relative; /* Needed for potential overlay animations */
	}

	.image-button:hover:not(:disabled) {
		border-color: #ff69b4;
		transform: scale(1.05); /* Slightly more pronounced scale */
	}

	.image-button.selected {
		border-color: #ff1493; /* Deeper pink for selected */
		box-shadow: 0 0 15px rgba(255, 20, 147, 0.6);
	}

	/* Pulsation for correct answer */
	.image-button.correctly-selected {
		animation: pulse 1s infinite alternate;
	}

	/* Keyframe animation for pulse */
	@keyframes pulse {
		from {
			transform: scale(1);
			box-shadow: 0 0 15px rgba(255, 20, 147, 0.6);
		}
		to {
			transform: scale(1.03);
			box-shadow: 0 0 25px rgba(255, 20, 147, 0.9);
		}
	}

	.image-button:disabled {
		cursor: default;
		opacity: 0.7;
	}

	.image-button img {
		width: 100%;
		height: auto;
		display: block;
		border-radius: 5px;
	}

	.message {
		margin-top: 20px;
		font-size: 1.2em;
		font-weight: bold;
		text-align: center;
		color: #ff69b4; /* Hot pink */
		background-color: #fff;
		animation: fadeIn 0.8s ease-out forwards; /* Fade in animation */
		border-radius: 10px;
		padding: 10px;
	}

	/* Keyframe animation for fade in */
	@keyframes fadeIn {
		from {
			opacity: 0;
			transform: translateY(10px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}
</style>
