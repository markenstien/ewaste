<?php build('content') ?>
    <div class="col-md-8 col-sm-12 mx-auto">
        <div class="card">
            <div class="card-body">
                <?php Flash::show()?>
                <?php 
                    Form::open([
                        'method' => 'post',
                        'action' => '',
                        'id' => 'purchaseForm',
                        'name' => 'purchaseForm',
                        'enctype' => 'multipart/form-data'
                    ]);

                    Form::hidden('item_id', $item->id);
                    Form::hidden('buyer_id', whoIs('id'));
                ?>

                
                <div style="border: 1px solid blue; border-radius:5px; padding:10px">
                    <ul class="list-unstyled">
                        <li><h5 class="font-12"><?php echo $user->firstname . ' '.$user->lastname?></h5></li>
                        <li>
                            <i data-feather="map-pin"></i><span class="badge bg-primary">Home</span> 
                            <?php echo $user->address?>
                        </li>
                        <li>Contact : <?php echo $user->phone?></li>
                    </ul>
                </div>

                <?php echo wDivider('30')?>
                <section>
                    <?php Form::hidden('', $item->sell_price, ['id' => 'itemAmount'])?>
                    <div> <i data-feather="shopping-bag"></i> <?php echo $item->owner->firstname?> <?php echo $item->owner->lastname?></div>
                    <div class="d-flex align-items-start mt-4">
                        <img src="<?php echo $item->images[0]->full_url?>" class="wd-100 wd-sm-200 me-3" alt="...">
                        <div>
                            <h5 class="mb-2">
                                <a href="<?php echo _route('item:catalog-detail', $item->id)?>"><?php echo $item->name?></a>
                            </h5>
                            <ul class="list-unstyled">
                                <li>Variant : <?php echo $item->variant?></li>
                                <li>Category : <?php echo $item->category_name?></li>
                                <li>Stocks : <?php echo $item->total_stock?></li>
                            </ul>
                            <p><?php echo $item->remarks?></p>
                            <small><?php echo $item->is_partner_verified ? "<i data-feather='user-check' class='text-primary'></i> ".COMPANY_NAME .' -partner verified ' : ''?></small>
                            <?php echo wDivider()?>
                            <div class="row">
                                <div class="col">
                                    <strong><?php echo amountHTML($item->sell_price)?></strong>
                                </div>
                                <div class="col">
                                    <div id="cart-quanity-controller">
                                        <button type="button" class="minus">-</button>
                                            <?php Form::number('quantity', 1, ['id' => 'quantity'])?>
                                        <button type="button" class="plus">+</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <?php echo wDivider('40')?>

                <section id="payment_method_section">
                    <h4>Select Payment Method</h4>
                    <div class="border-box">
                        <label for="cod">
                            <input type="radio" name="payment_method" id="cod" value="cod" checked>
                            Cash On Delivery
                        </label>
                    </div>

                    <div class="border-box">
                        <label for="bank">
                            <input type="radio" name="payment_method" id="bank" value="bank">
                            Bank/Paypal
                        </label>
                    </div>

                    <div class="border-box">
                        <label for="wallet">
                            <input type="radio" name="payment_method" id="wallet" value="wallet">
                            E-Wallet
                            (GCASH, PAYMAYA)
                        </label>

                        <div id="wallet_proof">
                            <?php echo wDivider('12')?>
                            <h4>Proof Of Payment</h4>
                            <?php Form::file('proof_of_payment')?>
                        </div>
                    </div>
                </section>
                <?php Form::close();?>
            </div>

            <div class="card-footer">
                <section class="row">
                    <div class="col-6">
                        Sub Total <h4>PHP : <span id="subTotal"><?php echo $item->sell_price * 1?></span></h4>
                    </div>
                    <div class="col-6">
                        <?php
                            if($item->total_stock > 0) {
                                Form::submit('', 'Place Order', ['class' => 'btn btn-primary form-verify mt-2', 'form' => 'purchaseForm']);
                            }else{
                                echo "<h2>OUT OF STOCKS</h2>";
                            }
                        ?>
                    </div>
                </section>
            </div>
        </div>
    </div>
<?php endbuild()?>

<?php build('scripts')?>
    <script>
        $(document).ready(function() {
            $("#cart-quanity-controller").on('click', function(e) {
                let quantityValue = Number.parseInt($("#quantity").val());
                let itemAmount = Number.parseFloat($("#itemAmount").val());
                let target = e.target;
                if($(target).hasClass('minus')) {
                    if(quantityValue > 1) {
                        $("#quantity").val(--quantityValue);
                    }
                } else {
                    $("#quantity").val(++quantityValue);
                }
                $("#subTotal").html(quantityValue * itemAmount)
            });

            $("#payment_method_section").on('click', function(e) {
                let target = $(e.target);
                
                if(target.is('input[type="radio"]')) {
                    if(target.val() == 'wallet') {
                        $("#wallet_proof").show();
                    }else{
                        $("#wallet_proof").hide();
                    }
                }
            });
        });
    </script>
<?php endbuild()?>

<?php build('styles')?>
    <style>
        #cart-quanity-controller {
            display: flex;
            flex-direction: row;;
        }
        #cart-quanity-controller button,
        #cart-quanity-controller #quantity{
            border: 1px solid #eee;
        }

        #wallet_proof{
            display: none;
        }
    </style>
<?php endbuild()?>
<?php loadTo()?>