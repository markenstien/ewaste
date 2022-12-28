<?php build('content')?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Available Commissions</h4>
            <p>as of <?php echo today()?></p>
        </div>

        <div class="card-body">
            <?php Flash::show()?>
            <?php echo wLinkDefault(_route('commission:release'),'Release All')?>
            <?php echo wLinkDefault(_route('commission:request'),'Requests')?>
            <div class="table-responsive">
                <table class="table table-bordered dataTable">
                    <thead>
                        <th>#</th>
                        <th>Name</th>
                        <th>Amount</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php foreach($commissions as $key => $row) :?>
                            <?php if($row->total_amount < 1) continue?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->name?></td>
                                <td><?php echo amountHTML($row->total_amount)?></td>
                                <td>
                                    <a href="<?php echo _route('commission:release', $row->user_id)?>" class="btn btn-primary btn-sm">Release</a>
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