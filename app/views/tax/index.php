<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Tax Logs</h4>
            <?php echo wLinkDefault(_route('tax:create'),' Update Tax')?>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <th>#</th>
                        <th>Tax Percentage</th>
                        <th>Active</th>
                        <th>Updated At</th>
                    </thead>

                    <tbody>
                        <?php foreach($tax_logs as $key => $row) :?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->tax_percentage?></td>
                                <td><span class="badge bg-<?php echo $row->is_active ? 'primary' : 'danger'?>"><?php echo $row->is_active ? 'Active' : 'Inactive'?></span></td>
                                <td><?php echo $row->updated_at?></td>
                            </tr>
                        <?php endforeach?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>