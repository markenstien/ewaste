<?php build('content') ?>
<div class="col-md-8 col-sm-12 mx-auto">
    <div class="card">
        <div class="card-body">
            <?php if($item->images) :?>
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <?php foreach($item->images as $key => $image) :?>
                        <div class="carousel-item active">
                            <img src="<?php echo $image->full_url?>" class="d-block w-100" alt="..." >
                        </div>
                    <?php endforeach?>
                </div>
                <a class="carousel-control-prev" data-bs-target="#carouselExampleControls" role="button" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </a>
                <a class="carousel-control-next" data-bs-target="#carouselExampleControls" role="button" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </a>
            </div>
            <?php endif?>

            <section class="product-info mt-4">
               <h4><span style="font-size:12px">PHP:</span> <?php echo amountHTML($item->sell_price)?></h4>
               <h5 class="mt-2"><?php echo $item->name?> <?php echo $item->is_partner_verified ? "<a href='#' style='margin-left:5px' title='{$item->verifier->firstname}'><i data-feather='user-check'></i></a>": ''?> </h5>  
               <ul class="list-unstyled">
                <li>Variant : <?php echo $item->variant?></li>
                <li>Category : <?php echo $item->category_name?></li>
               </ul>
               <p><strong>Remarks :</strong><br/> <?php echo $item->remarks?> </p>
            </section>

            <section class="product-info seller mt-4">
                <h6 class="mt-2">Seller</h6>
                <?php if($item->owner) :?>
                <div class="d-flex align-items-start">
                    <img src="<?php echo  $item->owner->profile?>" class="wd-100 wd-sm-200 me-3" alt="...">
                    <div>
                        <h5 class="mb-2"><?php echo $item->owner->firstname . ' '.$item->owner->lastname?></h5>
                        <ul class="list-unstyled">
                            <li>Last Active : <?php echo time_since($item->owner->created_at)?></li>
                            <li>Created Since : <?php echo time_since($item->owner->created_at)?></li>
                            <li><a href="#">Show Profile</a> | <a href="#">Show Catalogs</a></li>
                        </ul>
                    </div>
                </div>
                <?php else:?>
                    <h4>No Seller</h4>
                <?php endif?>
            </section>

            <?php if($item->is_partner_verified) :?>
                <section class="product-info seller mt-4">
                <h6 class="mt-2">Verifier</h6>
                    <div class="d-flex align-items-start">
                        <img src="<?php echo  $item->verifier->profile?>" class="wd-100 wd-sm-200 me-3" alt="...">
                        <div>
                            <h5 class="mb-2"><?php echo $item->verifier->firstname . ' '.$item->verifier->lastname?></h5>
                            <ul class="list-unstyled">
                                <li>Last Active : <?php echo time_since($item->verifier->created_at)?></li>
                                <li>Created Since : <?php echo time_since($item->verifier->created_at)?></li>
                                <li><a href="#">Show Profile</a></li>
                            </ul>
                        </div>
                    </div>
                </section>
            <?php else:?>
                <?php echo wLinkDefault(_route('item:verify', $item->id), 'Verify This product')?>
            <?php endif?>
        </div>

        <div class="card-footer">
            <a href="<?php echo _route('order:buy-now', $item->id, [
                'productId' => $item->id
            ])?>" class="btn btn-primary">Buy Now</a>
        </div>
    </div>
</div>
<?php endbuild()?>
<?php loadTo()?>