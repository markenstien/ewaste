<?php build('content') ?>
    <div class="col-md-5 mx-auto">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title"> Order Cancellation </h4>
                <?php echo wLinkDefault(_route('order:show', $id), 'Back to Order')?>
            </div>

            <div class="card-body">
                <?php Flash::show()?>
                <?php
                    Form::open([
                        'method' => 'post'
                    ]);
                    Form::hidden('order_id', $order->id);
                ?>
                    <div class="form-group">
                        <?php
                            Form::label('Reason');
                            Form::select('reason_id', $reasons, '', ['class' => 'form-control', 'required' => true, 'id' => 'reason_option']);
                        ?>

                        <div id="others">
                            <?php Form::text('reason_others', '', [
                                'class' => 'form-control',
                                'id' => 'reason_others',
                                'placeholder' => 'Others'
                            ])?>
                        </div>
                    </div>

                    <div class="form-group mt-2">
                        <?php
                            Form::label('Cancellation Description');
                            Form::textarea('description', '', [
                                'class' => 'form-control',
                                'rows' => 5,
                                'required' => true,
                                'placeholder' => 'Help us understand your reason for cancellation'
                            ])
                        ?>
                    </div>

                    <div class="form-group mt-2">
                        <?php Form::submit('', 'Submit')?>
                    </div>
                <?php Form::close()?>
            </div>
        </div>
    </div>
<?php endbuild()?>

<?php build('scripts') ?>
    <script>
        $(document).ready(function()
        {
            $("#others").hide();
            $("#reason_option").change(function() {
                let value = $(this).val();
                if(value == '_others_') {
                    $("#others").show();
                }else{
                    $("#others").hide();
                }
            });
        });
    </script>
<?php endbuild()?>
<?php loadTo()?>