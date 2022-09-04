<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Orders</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered dataTable">
                    <thead>
                        <th>#</th>
                        <th>Reference</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Total</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php foreach($orders as $key => $row) :?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->reference?></td>
                                <td><?php echo $row->customer_name?></td>
                                <td><?php echo $row->created_at?></td>
                                <td><?php echo amountHTML($row->net_amount)?></td>
                                <td>
                                    <?php 
										$anchor_items = [
											[
												'url' => _route('receipt:order' , $row->id),
												'text' => 'Receipt',
												'icon' => 'eye'
											],

											[
												'url' => _route('order:show', $row->id),
												'text' => 'Preview',
												'icon' => 'eye'
											]
										];
									echo anchorList($anchor_items)?>
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