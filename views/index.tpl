<div style="width: 700px; margin: 50px auto;">
	<h1>Summarizer</h1>

	<form action="." method="post">
		<p>
			<label for="text">Text:</label>
		</p>
		<p>
			<textarea id="text" name="text" style="width: 100%; height: 200px;">{{ text }}</textarea>
		</p>
		<p>
			<label for="number">Number of sentences:</label>
			<input type="number" min="1" value="{{ number }}" name="number" id="number"/>
		</p>
		<p>
			<button type="submit">Summarize</button>
		</p>
	</form>

	% if result:
	<h2>Result</h2>
	<p>
		{{ result }}
	</p>
	% end
</div>
