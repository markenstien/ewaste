<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Add Item</h4>
        </div>

        <div class="card-body">
            <?php echo $supplyOrderItemForm->start();?>
                <?php echo $supplyOrderItemForm->getFormItems()?>
            <?php echo $supplyOrderItemForm->end()?>
        </div>
    </div>
<?php endbuild() ?>
<?php loadTo()?>