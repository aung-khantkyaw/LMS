
		</div>
	</div>


	<script src="app.js"></script>
	<script>
	let url = window.location.pathname;
	let filename = url.substring(url.lastIndexOf('/')+1);
	let curFile = document.getElementById(filename);
	  curFile.classList.add("active");
	
		document.addEventListener("DOMContentLoaded", function() {
			let date = new Date(Date.now());
			let defaultDate = date.getUTCFullYear() + "-"
					+ (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
			document.getElementById("datetimepicker-dashboard").flatpickr({
				inline : true,
				prevArrow : "<span title=\"Previous month\">&laquo;</span>",
				nextArrow : "<span title=\"Next month\">&raquo;</span>",
				defaultDate : defaultDate
			});
		});
	</script>

</body>
</html>