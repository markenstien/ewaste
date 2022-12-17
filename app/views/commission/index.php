<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Commissions</h4>
        </div>

        <div class="card-body">
            <?php $total = 0?>
            <div class="table-responsive">
                <table class="table table-bordered dataTable">
                    <thead>
                        <th>#</th>
                        <th>Order</th>
                        <th>Amount</th>
                        <th>Date</th>
                    </thead>

                    <tbody>
                        <?php foreach($commissions as $key => $row) :?>
                        <?php $total += $row->amount?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo wLinkDefault(_route('order:show', $row->order_id), $row->order_reference) ?></td>
                                <td><?php echo $row->amount?></td>
                                <td><?php echo $row->commission_date?></td>
                            </tr>
                        <?php endforeach?>
                    </tbody>
                </table>
            </div>
            <h4>Total : <?php echo $total?></h4>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>