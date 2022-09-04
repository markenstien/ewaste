<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Supply Order</h4>
            <?php echo wLinkDefault(_route('supply-order:index'), 'Supply Orders')?>
        </div>
        <div class="card-body">
            <?php echo $form->getForm()?> 
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>