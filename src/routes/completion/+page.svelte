<script lang="ts">
	import { base } from '$app/paths';
</script>

<div class="completion-container">
	<img src="{base}/images/our-picture.jpg" alt="A picture of us" class="our-picture" />
	<h1>Betty "bbbb" Yuliani,</h1>
	<p>Happy Valentine's Day, my beloved!</p>
	<p>I wish you could understand how much you mean to me.</p>
	<p>Thank you for putting up with me, no matter how difficult I am.</p>
	<p>Thank you for the picture frame, the cologne, the debugging...</p>
	<p>Thank you for being there whenever I ask.</p>
	<p>Thank you for being my soulmate.</p>
	<p>- Your Snowen</p>
</div>

<style>
	.completion-container {
		display: flex; /* Enables flexbox layout for the message area */
		flex-direction: column; /* Stacks completion elements vertically */
		align-items: center; /* Centers elements horizontally */
		justify-content: center; /* Centers elements vertically within the screen */
		min-height: 100%; /* Ensures the container height matches the parent's full height */
		text-align: center; /* Centers text content */
		padding: 20px; /* Provides breathing room around the edges */
		font-family: 'Handmade Alphabet', cursive; /* Cute Valentine's Day font */
		color: #333; /* Soft dark color for readability */
		background-color: #fffafa; /* Snow white background for the text box */
	}

	.our-picture {
		max-width: 80%; /* Limits the width of the image */
		max-height: 400px; /* Limit height for larger images */
		border-radius: 15px; /* Slightly rounded corners for the picture */
		margin-bottom: 30px; /* Adds space below the image */
		box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Initial soft shadow */
		object-fit: cover; /* Ensures the image covers the area without distortion */
		transition: all 0.3s ease-in-out; /* Smooth transition for the hover effect */
	}

	.our-picture:hover {
		transform: translateY(-10px) scale(1.05); /* Lifts and scales the image up for a "pop-out" effect */
		box-shadow: 0 12px 25px rgba(0, 0, 0, 0.3); /* Enhances the depth shadow */
		filter: drop-shadow(0 0 15px rgba(233, 30, 99, 0.6)); /* Adds a romantic pink background glow */
	}

	h1 {
		color: #e91e63; /* Deeper pink color for the title */
		margin-bottom: 25px; /* Adds space below the header */
		font-size: 2.8em; /* Sets a large font size for the header */
		font-family: 'Handmade Alphabet', cursive; /* Cute Valentine's Day font for the name */
	}

	p {
		font-size: 1.3em;
		line-height: 1.6;
		margin-bottom: 15px;
		max-width: 700px;
	}

	/* Basic responsive adjustments */
	@media (max-width: 768px) {
		.our-picture {
			max-height: 300px;
		}
		h1 {
			font-size: 2em;
		}
		p {
			font-size: 1em;
		}
	}
</style>
