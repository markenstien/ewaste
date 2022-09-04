<?php build('content') ?>

    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Purchase</h4>
            <?php Flash::show()?>
            #<?php echo $session?> <a href="<?php echo _route('transaction:purchaseReset',['csrfToken' => csrfGet()])?>">Reset</a>
        </div>
        
        <div class="row">
            <div class="col-md-8">
                <div class="card-body">
                    <h4>Items</h4>
                    <a href="#" type="button" 
                            class="btn btn-primary btn-sm" data-bs-toggle="modal" 
                            data-bs-target="#exampleModalLongScollable"> Add Item </a>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <th>Quantity</th>
                                <th>SKU</th>
                                <th>Item</th>
                                <th>Price</th>
                                <th>Total</th>
                                <th>Discount</th>
                                <th>Sub Total</th>
                            </thead>

                            <tbody>
                                <?php $totalAmount = 0?>
                                <?php foreach($items as $key => $row) :?>
                                    <?php $totalAmount += $row->sold_price?>
                                    <tr>
                                        <td>
                                            <?php echo $row->quantity?>
                                            <div>
                                                <a href="?action=edit_item&id=<?php echo $row->id?>&csrfToken=<?php echo csrfGet()?>">Edit</a>
                                                <a href="?action=delete_item&id=<?php echo $row->id?>&csrfToken=<?php echo csrfGet()?>">Delete</a>
                                            </div>
                                        </td>
                                        <td><?php echo $row->sku?></td>
                                        <td><?php echo $row->name?></td>
                                        <td><?php echo $row->price?></td>
                                        <td><?php echo $row->price * $row->quantity?></td>
                                        <td>
                                            <?php echo $row->discount_price?>
                                            <div><?php echo $row->remarks?></div>
                                        </td>
                                        <td><?php echo amountHTML($row->sold_price)?></td>
                                    </tr>
                                <?php endforeach?>
                                <tr>
                                    <td colspan="6"><h5>Total</h5></td>
                                    <td><?php echo amountHTML($totalAmount)?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <section>
                        <div class="modal fade" id="exampleModalLongScollable" tabindex="-1" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalScrollableTitle">Add Item</h5>
                                    <button type="button" class="btn-close" 
                                        data-bs-dismiss="modal" aria-label="btn-close"></button>
                                </div>
                                <div class="modal-body">
                                    <?php
                                        Form::open([
                                            'method' => 'post'
                                        ]);

                                        if(isset($request['id'])) {
                                            Form::hidden('id', $request['id']);
                                        }
                                    ?>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <?php echo $purchase_item_form->getCustom('item_id','col')?>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <?php echo $purchase_item_form->getCol('available_stock')?>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $purchase_item_form->getCol('price')?>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $purchase_item_form->getCol('quantity')?>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $purchase_item_form->getCol('discount_price')?>
                                        </div>

                                        <div class="form-group">
                                            <?php echo $purchase_item_form->getCol('remarks')?>
                                        </div>

                                    <div class="form-group">
                                        <?php Form::submit('add_item', 'Save')?>
                                        <a href="?" class="btn btn-warning btn-sm">Cancel</a>
                                    </div>
                                    <?php Form::close()?>
                                </div>
                            </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card-body">
                    <?php echo $paymentForm->start()?>
                        <h4>Payment</h4>
                        <?php echo $paymentForm->getFormItems();?>
                        <section id="onlinePaymentMeta">
                            <h4 class="mb-2">Online Payment Details</h4>
                            <div class="form-group">
                                <?php echo $paymentOnlineForm->getRow('organization')?>
                            </div>
                            <div class="form-group">
                                <?php echo $paymentOnlineForm->getRow('external_reference')?>
                            </div>
                            <div class="form-group">
                                <?php echo $paymentOnlineForm->getRow('account_number')?>
                            </div>
                        </section>
                        <input type="submit" class="btn btn-primary btn-sm" value="Save Payment">
                    <?php echo $paymentForm->end()?>
                </div>
            </div>
        </div>
    </div>
<?php endbuild()?>

<?php build('styles')?>
    <style>
        #onlinePaymentMeta{
            display: none;
        }
    </style>
<?php endbuild()?>
<?php build('scripts')?>
    <script>
        $(document).ready(function()
        {
            let price = $("#price");
            let stock = $("#available_stock");
            let quantity = $("#quantity");    
            let item = $("#item");

            displayPriceAndStock();

            $("#item").change(function(e){
                displayPriceAndStock();
            });
            
            $("#payment_method").change(function(e) {
                if($(this).val() == 'ONLINE') {
                    $("#onlinePaymentMeta").show();
                }else{
                    $("#onlinePaymentMeta").hide();
                }
            });

            function displayPriceAndStock() {
                if(item.val().length === 0) {

                } else {
                    let itemSelected = item.find(':selected');
                    price.val(itemSelected.data('price'));
                    stock.val(itemSelected.data('stock'));

                    if(quantity.val().length == 0)
                        quantity.val(1);
                    $("#exampleModalLongScollable").modal('show');
                }
            }
        });
    </script>
<?php endbuild()?>
<?php loadTo()?>