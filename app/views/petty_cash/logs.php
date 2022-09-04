<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Petty Cash (LOGS)</h4>
            <?php Flash::show()?>
            <?php echo wLinkDefault(_route('petty-cash:index'),'Petty Cash')?>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered dataTable">
                    <thead>
                        <th>#</th>
                        <th>Staff</th>
                        <th>Amount</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php $total = 0?>
                        <?php foreach($logs as $key => $row) :?>
                            <?php $total += $row->amount?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->staff_name?></td>
                                <td><?php echo amountHTML($row->amount)?></td>
                                <td><?php echo $row->category?></td>
                                <td><?php echo $row->remarks?></td>
                                <td><?php echo $row->date?></td>
                                <td>
                                    <a href="<?php echo _route('petty-cash:edit', $row->id)?>">Edit</a>
                                </td>
                            </tr>
                        <?php endforeach?>
                    </tbody>
                </table>
                <h4>Total : <?php echo amountHTML($total)?></h4>
            </div>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>