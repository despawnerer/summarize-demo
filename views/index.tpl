<title>Summarize</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, user-scalable=yes">

<style>
body {
	margin: 0;
	padding: 0;
	background: white;
	color: black;
	font-family: sans-serif;
	font-size: 16px;
}

p {
	margin: 1em 0;
	line-height: 1.2em;
}

h2 {
	margin: 1em 0 0.5em 0;
}

#container {
	width: 100%;
	max-width: 700px;
	margin: 25px auto;
	padding: 0 25px;
	box-sizing: border-box;
}

#text, #number {
	border: 1px solid gray;
	font-size: 90%;
}

#text {
	width: 100%;
	height: 200px;
	box-sizing: border-box;
	padding: 10px;
}

#number {
	width: 4em;
	padding: 5px;
	margin: 0 0 0 1em;
}

#submit {
	margin: 0;
	font-size: 90%;
	padding: 5px;
}
</style>

<div id="container">
	<h1>Summarizer</h1>

	<form action="." method="post">
		<p>
			<label for="text">Text:</label>
		</p>
		<p>
			<textarea id="text" name="text">{{ text }}</textarea>
		</p>
		<p>
			<label for="number">Number of sentences:
				<input type="number" min="1" value="{{ number }}" name="number" id="number"/>
			</label>
		</p>
		<p>
			<label for="language">Language:
				<select name="language" id="language">
					% for a_language in available_languages:
						<option value="{{ a_language }}"{{ " selected" if language == a_language else "" }}>{{ a_language.capitalize() }}</option>
					% end
				</select>
			</label>
		</p>
		<p>
			<button type="submit" id="submit">Summarize</button>
		</p>
	</form>

	% if result:
	<h2>Result</h2>
	<p>
		{{ result }}
	</p>
	% end
</div>
