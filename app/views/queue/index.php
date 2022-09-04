<?php build('content') ?>
	<div class="card">
		<?php Flash::show()?>

		<div class="card-header">
			<h4 class="card-title">Queueing</h4>
			<a href="<?php echo _route('queue:new')?>" class="btn btn-primary">New Queue</a>

			<a href="<?php echo _route('queue:live')?>" class="btn btn-primary">Live Link</a>

			<a href="<?php echo _route('queue:reset')?>" class="btn btn-danger">
				Reset
			</a>
		</div>

		<div class="card-body">

			<h3 class="text-center mb-4">
				Total Served : <?php echo $total_served?>
			</h3>
			<div class="row">
				<div class="col-md-6">
					<h5 class="mb-2">Waiting</h5>
					<?php if( !empty( $waiting_serving['waiting']) ) :?>
						<table class="table table-bordered">
							<thead>
								<tr>
									<td style="width:70%">Number</td>
									<td style="width:30%">Action</td>
								</tr>
							</thead>

							<tbody>
								<?php foreach( $waiting_serving['waiting'] as $key => $row) :?>
									<tr>
										<td><h4>#<?php echo $row->number_decimal?></h4></td>
										<td>
											<a href="<?php echo _route('queue:serve', $row->id)?>" class="btn btn-sm btn-primary">Serve</a>
											<a href="<?php echo _route('queue:skip' , $row->id)?>" class="btn btn-sm btn-danger">Skip</a>
										</td>
									</tr>
								<?php endforeach?>
							</tbody>
						</table>
					<?php endif?>
				</div>

				<div class="col-md-6">
					<h5 class="mb-2">Now Serving</h5>

					<?php if( !empty( $waiting_serving['serving']) ) :?>
						<table class="table table-bordered">
							<thead>
								<tr>
									<td style="width:70%">Number</td>
									<td style="width:30%">Action</td>
								</tr>
							</thead>

							<tbody>
								<?php foreach( $waiting_serving['serving'] as $key => $row) :?>
									<tr>
										<td><h4>#<?php echo $row->number_decimal?></h4></td>
										<td>
											<a href="<?php echo _route('queue:complete', $row->id)?>" class="btn btn-sm btn-primary">Complete</a>
										</td>
									</tr>
								<?php endforeach?>
							</tbody>
						</table>
					<?php endif?>
				</div>
			</div>
		</div>
	</div>
<?php endbuild()?>
<?php loadTo()?>