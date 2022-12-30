<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Items</h4>
            <?php echo wLinkDefault(_route('item:create'), 'Add Product')?>
        </div>
        <div class="card-body">
            <?php Flash::show()?>
            <div class="table-responsive">
                <table class="table table-bordered dataTable">
                    <thead>
                        <th>#</th>
                        <th>SKU</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php foreach($items as $key => $row) :?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->sku?></td>
                                <td><?php echo $row->name?></td>
                                <td><?php echo amountHTML($row->sell_price)?></td>
                                <td><?php echo $row->total_stock?></td>
                                <td>
                                    <?php echo wLinkDefault(_route('item:show', $row->id), 'Show')?>
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