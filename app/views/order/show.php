<?php build('content') ?>
<div class="row">
    <div class="col-md-7">
        <?php Flash::show()?>
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Order #: <?php echo $order->reference?></h4>
                <?php echo wLinkDefault(_route('order:edit', $order->id), 'Edit Order')?>
            </div>
            <?php if($isCancellable) :?>
                <div class="card-footer">
                    <a href="<?php echo _route('order:cancellation', $order->id)?>" class="btn btn-danger btn-sm">Cancel Order</a>
                </div>
            <?php endif?>
            <div class="card-body">
                <section>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td>Date Ordered</td>
                                    <td><?php echo $order->created_at?></td>
                                </tr>
                                <tr>
                                    <td>Customer</td>
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
                                <tr>
                                    <td>Gross</td>
                                    <td><?php echo amountHTML($order->gross_amount)?></td>
                                </tr>
                                <tr style="border:1px solid green">
                                    <td>Net Amount</td>
                                    <td>
                                        <strong><?php echo amountHTML($order->net_amount)?></strong>
                                        <div><small>Tax/Vat <?php echo $order->tax_amount?>(<?php echo $order->tax_percentage?>%)</small></div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Commission</td>
                                    <td>
                                        <strong><?php echo amountHTML($commission->amount ?? 0)?></strong>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <span class="badge <?php echo isEqual($order->status,['cancelled','returned']) ? 'bg-danger' : 'bg-primary'?>">Order Status : <?php echo strtoupper($order->status)?></span>
                    <span class="badge <?php echo $order->is_paid ? 'bg-success' : 'bg-primary'?>">Payment Status : <?php echo $order->is_paid ? 'PAID' : 'UN-PAID'?></span>
                    <span class="badge <?php echo $order->is_delivered ? 'bg-success' : 'bg-primary'?>">Delivery Status : <?php echo $order->is_delivered ? 'DELIVERED' : 'ON-GOING'?></span>
                
                    <?php if(isEqual($order->status,['cancelled','returned'])) :?>
                        <div class="mt-2">
                            <p>
                                <strong>Order Status Remarks</strong> <br>
                                <?php echo $order->remarks?>
                            </p>
                        </div>
                    <?php endif?>
                </section>

                <section>
                    <label for="" class="mt-3">Particulars</label>
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
                    <strong>Total : <?php echo amountHTML($order->net_amount)?></strong>
                </section>
            </div>
        </div>
    </div>
</div>
<?php endbuild()?>
<?php loadTo()?>