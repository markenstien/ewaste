<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title"><?php echo $supplyOrder->title?> (<small><?php echo $supplyOrder->reference?></small>) </h4>
            <?php Flash::show()?>
            <?php echo wLinkDefault(_route('supply-order:create'), 'Create New')?>
            <?php echo wLinkDefault(_route('supply-order:index'), 'Supply Orders')?>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <tr>
                        <td>Supplier : <?php echo $supplyOrder->supplier_name?></td>
                        <td>Date Of Order : <?php echo $supplyOrder->date?></td>
                        <td>Budget : <?php echo amountHTML($supplyOrder->budget)?></td>
                        <td>Status : <?php echo $supplyOrder->status?></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Description
                            <div><?php echo $supplyOrder->description?></div>
                        </td>
                    </tr>
                </table>
            </div>

            <?php if(isEqual($supplyOrder->status, 'pending')) :?>
                <a href="<?php echo _route('supply-order:approve-and-update-stock', $supplyOrder->id)?>" class="btn btn-primary btn-sm">Approve and Add Update Stock</a>
                <a href="#" class="btn btn-danger btn-sm">Cancel</a>
            <?php endif?>
        </div>

        <div class="card-body">
            <?php 
                if (isEqual($supplyOrder->status,'pending')) {
                    echo wLinkDefault(_route('supply-order-item:add-item', $supplyOrder->id),'Add Item');
                }
            ?>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <th>#</th>
                        <th>Item</th>
                        <th>Quantity</th>
                        <th>Supplier Price</th>
                        <th>Total Amount</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php $total = 0?>
                        <?php foreach($supplyOrder->items as $key => $row) :?>
                            <?php $total += ($row->supplier_price * $row->quantity)?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->name?></td>
                                <td><?php echo $row->quantity?></td>
                                <td><?php echo $row->supplier_price?></td>
                                <td><?php echo amountHTML($row->supplier_price * $row->quantity)?></td>
                                <td>
                                    <?php if(isEqual($supplyOrder->status,'pending')) :?>
                                        <a href="<?php echo _route('supply-order-item:edit-item', $row->id)?>">Edit</a> | 
                                        <a href="<?php echo _route('supply-order-item:delete', $row->id)?>">Delete</a>
                                    <?php else:?>
                                        <div>Not Editable</div>
                                    <?php endif?>
                                </td>
                            </tr>
                        <?php endforeach?>
                        <tr>
                            <td colspan="4"><h3>Total:</h3></td>
                            <td><h4><?php echo amountHTML($total)?></h4></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>