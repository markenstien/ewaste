<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Create Payment</h4>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <h4>Order Details</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <tr>
                                <td>Order Reference : #</td>
                                <td><?php echo $order->reference?></td>
                            </tr>
                            <tr>
                                <td>Customer :</td>
                                <td><?php echo $order->customer_name?></td>
                            </tr>
                            <tr>
                                <td>Amount :</td>
                                <td><?php echo $order->net_amount?></td>
                            </tr>
                            <tr>
                                <td>Status :</td>
                                <td><?php echo $order->status?></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="col-md-6 mt-5">
                    <h4>Payment Form</h4>
                    <?php echo $_form->getForm()?>
                </div>
            </div>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>