<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Payment</h4>
        </div>

        <div class="card-body">
            <table class="table table-bordered">
                <tr>
                    <td>Reference: </td>
                    <td>#<?php echo $payment->reference?></td>
                </tr>
                <tr>
                    <td>Method</td>
                    <td><?php echo $payment->payment_method?></td>
                </tr>

                <?php if(isEqual($payment->payment_method, 'ONLINE')) :?>
                    <tr>
                        <td>External Reference: </td>
                        <td>#<?php echo $payment->external_reference?></td>
                    </tr>
                    <tr>
                        <td>Organization: </td>
                        <td><?php echo $payment->organization?></td>
                    </tr>
                    <tr>
                        <td>Account Number: </td>
                        <td><?php echo $payment->account_number?></td>
                    </tr>
                <?php endif?>
                <tr>
                    <td>Amount: </td>
                    <td><?php echo $payment->amount?></td>
                </tr>
                <tr>
                    <td>Order: </td>
                    <td><a href="<?php echo _route('order:show', $payment->order_id)?>">Show</a></td>
                </tr>
            </table>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>