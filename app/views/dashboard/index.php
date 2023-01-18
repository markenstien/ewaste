<?php build('content')?>

<div class="row">
	<div class="col-md-3 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
			<div class="d-flex justify-content-between align-items-baseline">
				<h6 class="card-title mb-0">Sales</h6>
			</div>
			<div class="row">
				<div class="col-6 col-md-12 col-xl-5">
					<h3 class="mb-2"><?php echo amountHTML($totalSales)?></h3>
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

	<div class="col-md-3 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
			<div class="d-flex justify-content-between align-items-baseline">
				<h6 class="card-title mb-0">Orders</h6>
			</div>
			<div class="row">
				<div class="col-6 col-md-12 col-xl-5">
					<h3 class="mb-2"><?php echo $totalOrders?></h3>
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

	<div class="col-md-3 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
			<div class="d-flex justify-content-between align-items-baseline">
				<h6 class="card-title mb-0">Catalogs</h6>
			</div>
			<div class="row">
				<div class="col-6 col-md-12 col-xl-5">
					<h3 class="mb-2"><?php echo $totalCatalogs?></h3>
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

	<div class="col-md-3 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
			<div class="d-flex justify-content-between align-items-baseline">
				<h6 class="card-title mb-0">Users</h6>
			</div>
			<div class="row">
				<div class="col-6 col-md-12 col-xl-5">
					<h3 class="mb-2"><?php echo $totalSellers?></h3>
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

<h4>Commissions</h4>
<div class="table-resonsive">
	<table class="table table-bordered dataTable">
		<thead>
			<th>Order</th>
			<th>Order Total</th>
			<th>Amount</th>
			<th>Seller</th>
			<th>Date</th>
		</thead>

		<tbody>
			<?php foreach($commissions as $key => $row) :?>
				<tr>
					<td><?php echo $row->order_reference?></td>
					<td><?php echo $row->order_price?></td>
					<td><?php echo $row->amount?></td>
					<td><?php echo $row->beneficiary_name?></td>
					<td><?php echo $row->created_at?></td>
				</tr>
			<?php endforeach?>
		</tbody>
	</table>
</div>
<?php endbuild()?>
<?php loadTo()?>