<?php build('content') ?>
<div class="card">
    <div class="card-header">
        <h4 class="card-title">Commissions Requests</h4>
        <?php echo wLinkDefault(_route('commission:available-commissions', null, ['page' => 'pending']), 'Return')?>
    </div>

    <div class="card-body">
        <?php Flash::show()?>
        <?php echo wLinkDefault(_route('commission:request', null, ['page' => 'pending']), 'Pending Requests')?> | 
        <?php echo wLinkDefault(_route('commission:request', null, ['page' => 'approved']), 'Approved Requests')?> |
        <?php echo wLinkDefault(_route('commission:request', null, ['page' => 'declined']), 'Declined Requests')?>
        <div class="table-responsive">
            <table class="table table-bordered dataTable">
                <thead>
                    <th>#</th>
                    <th>Name</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <?php if(isEqual($page,'pending')) :?>
                        <th>Action</th>
                    <?php endif?>
                </thead>

                <tbody>
                    <?php foreach($commission_requests as $key => $row) :?>
                        <tr>
                            <td><?php echo ++$key?></td>
                            <td><?php echo $row->name?></td>
                            <td><?php echo $row->amount?></td>
                            <td><?php echo $row->status?></td>
                            <?php if(isEqual($page,'pending')) :?>
                            <td>
                                <a href="<?php echo _route('commission:request',$row->id, [
                                    'action' => 'approve',
                                    'csrf' => $csrf,
                                    'id' => $row->id,
                                ])?>" class="btn btn-primary btn-sm">Approve</a>
                                <a href="<?php echo _route('commission:request',$row->id, [
                                    'action' => 'cancel',
                                    'csrf' => $csrf,
                                    'id' => $row->id
                                ])?>" class="btn btn-primary btn-sm">Decline</a>
                            </td>
                            <?php endif?>
                        </tr>
                    <?php endforeach?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php endbuild()?>
<?php loadTo()?>