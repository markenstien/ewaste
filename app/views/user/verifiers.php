<?php build('content') ?>
	
	<div class="card">
		<div class="card-header">
			<h4 class="card-title">Users</h4>
			<?php echo btnCreate(_route('user:create'))?>
		</div>

		<div class="card-body">
			<?php Flash::show()?>

			<div class="table-responsive" style="min-height: 30vh;">
				<table class="table table-bordered dataTable">
					<thead>
						<th>Name</th>
						<th>Gender</th>
						<th>Phone Number</th>
						<th>Type</th>
						<th>Application Status</th>
						<th>Action</th>
					</thead>

					<tbody>
                        <?php $csrf = csrfGet()?>
						<?php foreach($users_for_approvals as $row) :?>
							<tr>
								<td><?php echo $row->lastname . ' , ' .$row->firstname?></td>
								<td><?php echo $row->gender ?></td>
								<td><?php echo $row->phone ?></td>
								<td><?php echo $row->user_type ?></td>
                                <td><?php echo $row->verifier_application_status?></td>
								<td>
                                    <a href="<?php echo _route('user:toPartner', $row->id, [
                                        'from' => 'admin',
                                        'csrf' => $csrf
                                    ])?>" class="btn btn-primary btn-sm form-verify">Approve</a>
                                    <a href="<?php echo _route('user:toPartner', $row->id, [
                                        'from' => 'admin',
                                        'action' => 'declined',
                                        'csrf' => $csrf
                                    ])?>" class="btn btn-warning btn-sm form-verify">Decline</a>
                                </td>
							</tr>
						<?php endforeach?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<?php endbuild()?>
<?php loadTo()?>