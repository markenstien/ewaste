<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Orders</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <th>#</th>
                        <th>Reference</th>
                        <th>Customer</th>
                        <th>Amount</th>
                        <th>Order Status</th>
                        <th>Delivery</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php foreach($orders as $key => $row) :?>
                            <?php $amount = amountHTML($row->net_amount)?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->reference?></td>
                                <td><?php echo $row->customer_name?></td>
                                <td><?php echo $amount?></td>
                                <td><?php echo $row->status?></td>
                                <td><?php echo $row->is_delivered ? 'Delivered': 'Pending'?></td>
                                <td>
                                    <?php echo wLinkDefault(_route('order:show', $row->id), 'Show')?>
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