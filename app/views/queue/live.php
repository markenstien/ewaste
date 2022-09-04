<?php build('content')?>
	<div class="container">
		
		<div class="card">
			<div class="card-header">
				<div class="text-center">
					<h1 class="mb-1"><?php echo COMPANY_NAME?></h1>
					<h4 class="card-title">Queueing</h4>
				</div>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-md-6">
						<h5 class="mb-2">Waiting</h5>
						<table class="table table-bordered">
							<thead>
								<td>Number</td>
							</thead>

							<tbody id="id_waiting_tbody">
								
							</tbody>
						</table>
					</div>
					<div class="col-md-6">
						<h5 class="mb-2">Now Serving</h5>
						<table class="table table-bordered">
							<thead>
								<td>Number</td>
							</thead>
							<tbody id="id_serving_tbody">
								
							</tbody>
						</table>
					</div>
				</div>	
			</div>
		</div>
	</div>
<?php endbuild()?>

<?php build('scripts')?>
	
	<script type="text/javascript">
		$(document).ready( function(e)
		{
			let url = getURL('api/Queueing/waitingAndServing');

			setInterval( function()
			{
				var TBODY_SERVING_ITEMS = '';
				var TBODY_WAITING_ITEMS = '';

				$.ajax({
					url: url,
					type: 'get',
					success: function(response) 
					{
						let jsonExtract = JSON.parse(response);

						// console.log(jsonExtract);

						let serving = jsonExtract.serving;
						let waiting = jsonExtract.waiting;

						$.each(serving , function(index , value) {
							TBODY_SERVING_ITEMS += `
								<tr>
									<td><h2>#${value.number_decimal}</h2></td>
								<tr>
							`;
						});

						$.each(waiting , function(index , value) {
							TBODY_WAITING_ITEMS += `
								<tr>
									<td><h2>#${value.number_decimal}</h2></td>
								<tr>
							`;
						});

						$("#id_waiting_tbody").html(TBODY_WAITING_ITEMS);
						$("#id_serving_tbody").html(TBODY_SERVING_ITEMS);
					}
				});

			} , 3000);

			
		} );
	</script>
<?php endbuild()?>

<?php loadTo('tmp/base')?>