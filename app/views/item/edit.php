<?php build('content') ?>

    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Item</h4>
            <?php echo btnList(_route('item:index'))?>
            <?php Flash::show()?>
        </div>

        <div class="card-body">
            <?php echo $item_form->getForm()?>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>