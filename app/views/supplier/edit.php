<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Edit Supplier</h4>
            <?php echo btnView(_route('supplier:show', $id))?>
            <?php Flash::show()?>
        </div>
        <div class="card-body">
            <?php echo $supplier_form->getForm()?>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>