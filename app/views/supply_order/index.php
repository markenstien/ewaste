<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Supply Orders</h4>
            <?php Flash::show()?>
            <?php echo wLinkDefault(_route('supply-order:create'), 'Create New')?>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered dataTable">
                    <thead>
                        <th>#</th>
                        <th>Reference</th>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php foreach($supplyOrders as $key => $row) :?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->reference?></td>
                                <td><?php echo $row->title?></td>
                                <td><?php echo $row->date?></td>
                                <td>
                                    <a href="<?php echo _route('supply-order:show', $row->id)?>">
                                        Show
                                    </a>
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