<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Petty Cash</h4>
            <?php Flash::show()?>
            <?php echo wLinkDefault(_route('petty-cash:create'),'Create')?>
        </div>
        <div class="card-body">
            <h4>Money On Hand</h4>
            <div class="table-responsive">
                <table class="table table-bordered dataTable">
                    <thead>
                        <th>#</th>
                        <th>Staff</th>
                        <th>Amount</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php foreach($petty_cash as $key => $row) :?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->staff_name?></td>
                                <td><?php echo amountHTML($row->total_amount)?></td>
                                <td>
                                    <a href="<?php echo _route('petty-cash:logs',$row->user_id)?>">Show</a>
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