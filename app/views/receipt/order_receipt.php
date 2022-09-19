<?php build('content') ?>
    <div class="mx-auto col-md-6">
        <div>
            <div class="text-center">
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
                            <td>
                                <?php echo amountHTML($row->quantity * $row->price)?>
                            </td>
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
            </section>

            <section class="mt-5">
                <a href="<?php echo _route('transaction:purchase')?>" class="btn btn-primary btn-sm">Back</a>
            </section>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo('tmp/basic')?>