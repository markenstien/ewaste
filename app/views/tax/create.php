<?php build('content') ?>
<div class="col-md-6 mx-auto">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Tax Management</h4>
            <?php echo wLinkDefault(_route('tax:index'), 'Tax Logs')?>
        </div>

        <div class="card-body">
            <?php
                Form::open([
                    'method' => 'post'
                ])
            ?>
                <div class="form-group">
                    <?php
                        Form::label('Tax Percentage(%)');
                        Form::text('tax_percentage','', [
                            'class' => 'form-control',
                            'required' => true,
                            'placeholder' => 'Eg. 2'
                        ])
                    ?>
                </div>

                <div class="form-group mt-3">
                    <?php Form::submit('Update Tax'); ?>
                </div>
            <?php Form::close()?>
        </div>
    </div>
</div>
<?php endbuild()?>
<?php loadTo()?>