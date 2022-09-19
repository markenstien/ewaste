<?php build('content') ?>
<div class="mx-auto col-md-10">
    <?php Flash::show()?>
    <div>
        <div class="text-center">
            <?php if(isEqual($order->status, 'cancelled')) :?>
                <div class="alert alert-danger">
                    <p class="alert-text">Order is Void</p>
                </div>
            <?php endif?>
            <h1>#<?php echo $order->reference?></h1>
            <p>Order Receipt</p>
        </div>
        <h3>Customer Info</h3>
        <table class="table table-bordered">
            <tr>
                <td>Customer Name : </td>
                <td><?php echo $order->customer_name?></td>
            </tr>
            <tr>
                <td>Mobile Number : </td>
                <td><?php echo $order->customer_phone?></td>
            </tr>
            <tr>
                <td>Address : </td>
                <td><?php echo $order->customer_address?></td>
            </tr>
        </table>
        <h3>Particulars</h3>
        <table class="table-bordered table">
            <thead>
                <th>Quantity</th>
                <th>Item</th>
                <th>Price</th>
                <th>Total</th>
            </thead>

            <tbody>
                <?php foreach($items as $key => $row):?>
                    <tr>
                        <td><?php echo $row->quantity?></td>
                        <td><?php echo $row->name?></td>
                        <td><?php echo amountHTML($row->price)?></td>
                        <td><?php echo amountHTML($row->price * $row->quantity)?></td>
                    </tr>
                <?php endforeach?>
            </tbody>
        </table>


        <section>
            <h1>Total : <?php echo amountHTML($order->net_amount)?></h1>
        </section>

        <section class="mt-2">
            <h3>Payment</h3>
            <p>Total : 
                #<?php echo $payment->reference?>(Keep this reference number) Total Amount Paid : <?php echo amountHTML($payment->amount)?> | Method : <?php echo $payment->payment_method?>
                <?php
                    if($payment->organization) {
                        echo '| ORG : '. $payment->organization . ' | REFERENCE : '. $payment->external_reference;
                    }
                ?>
            </p>
            <?php if($payment->is_removed) :?>
                <h5 class="text-danger">Payment Removed</h5>
            <?php endif?>
        </section>

        <?php if(!isEqual($order->status, 'cancelled')) :?>
            <section class="mt-5">
                <a href="<?php echo _route('order:void', $order->id, [
                    'csrfToken' => csrfGet()
                ])?>" class="btn btn-danger btn-sm form-verify" data-message="Payment will be removed as well">VOID ORDER</a>
            </section>
        <?php endif?>
    </div>
</div>
<?php endbuild()?>
<?php loadTo()?>