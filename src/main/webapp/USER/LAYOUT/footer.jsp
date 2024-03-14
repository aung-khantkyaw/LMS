
		</div>
	</div>


	<script src="app.js"></script>
	<script>
	let url = window.location.pathname;
	let filename = url.substring(url.lastIndexOf('/')+1);
	let curFile = document.getElementById(filename);
	  curFile.classList.add("active");
	</script>

</body>
</html>