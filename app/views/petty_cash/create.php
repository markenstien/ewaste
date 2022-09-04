<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Petty Cash</h4>
            <?php Flash::show()?>
            <?php echo wLinkDefault(_route('petty-cash:index'), 'Petty Cash')?>
        </div>
        <div class="card-body">
            <?php echo $form->getForm()?>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>