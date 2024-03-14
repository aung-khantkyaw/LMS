<%@ include file="LAYOUT/header.jsp"%>

<main class="content">
	<div class="container-fluid p-0 ">
		<div class="row">
			<div class="col-12 col-lg-8 col-xxl-9 d-flex">
				<div class="card flex-fill">
					<div class="card-header">
						<h5 class="card-title mb-0">Borrowed Books</h5>
					</div>
					<table class="table table-hover my-0">
						<thead>
							<tr>
								<th scope="col">Borrow Id</th>
								<th scope="col">User Name</th>
								<th scope="col">Book Name</th>
								<th scope="col">Borrow Date</th>
								<th scope="col">Due Date</th>
								<th scope="col">Return Date</th>
							</tr>
						</thead>
						<tbody>
							


						</tbody>
					</table>
				</div>
			</div>
			<div class="col-12 col-lg-4 col-xxl-3 d-flex">
				<div class="card flex-fill w-100">
					<div class="card-header">

						<h5 class="card-title mb-0">Calendar</h5>
					</div>
					<div class="card-body d-flex w-100">
						<div class="align-self-center chart chart-lg">
							<div id="datetimepicker-dashboard"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="LAYOUT/footer.jsp"%>