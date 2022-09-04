<?php build('content')?>

<div class="row">
	<div class="col-md-4 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
			<div class="d-flex justify-content-between align-items-baseline">
				<h6 class="card-title mb-0">Sales</h6>
			</div>
			<div class="row">
				<div class="col-6 col-md-12 col-xl-5">
					<h3 class="mb-2"><?php echo amountHTML($orderAmountTotal)?></h3>
					<div class="d-flex align-items-baseline">
						<p class="text-success">
						<span>Within 30 days</span>
						</p>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

	<div class="col-md-4 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
			<div class="d-flex justify-content-between align-items-baseline">
				<h6 class="card-title mb-0">Items</h6>
			</div>
			<div class="row">
				<div class="col-6 col-md-12 col-xl-5">
					<h3 class="mb-2"><?php echo $totalItem?></h3>
					<div class="d-flex align-items-baseline">
						<p class="text-success">
						<span>Item Variants</span>
						</p>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

	<div class="col-md-4 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
			<div class="d-flex justify-content-between align-items-baseline">
				<h6 class="card-title mb-0">Staffs</h6>
			</div>
			<div class="row">
				<div class="col-6 col-md-12 col-xl-5">
					<h3 class="mb-2"><?php echo $totalUser?></h3>
					<div class="d-flex align-items-baseline">
						<p class="text-success">
						<span>Active</span>
						</p>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>

<div class="table-resonsive">
	<table class="table table-bordered dataTable">
		<thead>
			<th>Item</th>
			<th>Amount</th>
			<th>Discount</th>
		</thead>

		<tbody>
			<?php foreach($items as $key => $row) :?>
				<tr>
					<td><?php echo $row->item_name?></td>
					<td><?php echo $row->sold_price?></td>
					<td><?php echo $row->discount_price?></td>
				</tr>
			<?php endforeach?>
		</tbody>
	</table>
</div>
<?php endbuild()?>
<?php loadTo()?>