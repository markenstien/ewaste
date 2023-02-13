<?php build('content') ?>
<div class="mx-auto col-md-10">
    <div class="card">
        <?php if($isCancellable) :?>
            <div class="card-footer">
                <a href="<?php echo _route('order:cancellation', $order->id)?>" class="btn btn-danger btn-sm">Cancel Order</a>
            </div>
        <?php endif?>
        <div class="card-body">
            <?php Flash::show()?>
            <div>
                <div class="text-center">
                    <?php if(isEqual($order->status, 'cancelled')) :?>
                        <div class="alert alert-danger">
                            <p class="alert-text">Order is Void</p>
                        </div>
                    <?php endif?>
                    <h1>#<?php echo $order->reference?></h1>
                    <p>Order Receipt : <?php echo $order->status?> | Payment Status : <?php echo $order->is_paid ? 'PAID' : 'UN-PAID'?> | Delivery Status : <?php echo $order->is_delivered ? 'DELIVERED' : 'ON-GOING'?></p>
                </div>
                <h3>Customer Info</h3>
                <div class="table-responsive">
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
                </div>
                <h3 class="mt-5">Particulars</h3>
                <div class="table-responsive">
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
                </div>

                <section class="mt-3">
                    <h2>Total : <?php echo amountHTML($order->net_amount)?></h2>
                </section>

                <?php if(isEqual(whoIs('user_type'), 'CONSUMER')) :?>
                    <div class="bg-primary" style="padding: 10px;">
                        <h5>Verifier Commission</h5>
                        <?php foreach($items as $key => $row) :?>
                            <?php $commission = $orderService::verifierCommission($row->price)?>
                            <?php if($row->verifier) :?>
                                <h3>Total Commission(<?php echo $commission['commissionPercentage']?>): <?php echo $commission['commissionAmount']?> </h3>
                                <div>
                                    <h5>Verifier : <?php echo $row->verifier->firstname . ' '.$row->verifier->lastname ?></h5>
                                </div>
                            <?php endif?>
                        <?php endforeach?>
                    </div>
                <?php endif?>
                <section class="mt-2">
                    <h3 class="bg-success" style="padding: 10px;">Payment</h3>
                    <?php if($payment) :?>
                        <p>Total : 
                            #<?php echo $payment->reference?>(Keep this reference number) Total Amount Paid : <?php echo amountHTML($payment->amount)?> | Method : <?php echo $payment->payment_method?>
                            <?php
                                if($payment->organization) {
                                    echo '| ORG : '. $payment->organization . ' | REFERENCE : '. $payment->external_reference;
                                }
                            ?>
                        </p>

                        <?php if($payment->attachment):?>
                            <div class="col-md-5">
                                <h5>Proof Of Payment</h5>
                                <img src="<?php echo $payment->attachment->full_url?>" alt="">
                            </div>
                        <?php endif?>
                        <?php if($payment->is_removed) :?>
                            <h5 class="text-danger">Payment Removed</h5>
                        <?php endif?>
                        <?php else:?>
                            <h4>No Paymnet</h4>
                            <a href="<?php echo _route('payment:create', null, [
                                'order_id' => $order->id
                            ])?>">Create Payment</a>
                    <?php endif?>
                </section>

                <section class="mt-2">
                    <h3 class="bg-success" style="padding: 10px;">Delivery</h3>
                    <a href="<?php echo _route('order:delivered', $order->id)?>">Delivered</a>
                </section>

                <?php if(!isEqual($order->status, 'cancelled')) :?>
                    
                <?php endif?>
            </div>
        </div>
    </div>
</div>
<?php endbuild()?>
<?php loadTo()?>