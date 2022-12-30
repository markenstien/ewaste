<?php build('content') ?>
    <div class="row">
        <?php foreach($items as $key => $row) :?>
            <?php
                $image = $row->images[0] ?? 'N/A';
            ?>
            <div class="col-md-3 col-sm-12">
                <div class="card">
                    <a href="<?php echo _route('item:catalog-detail', $row->id)?>">
                        <img src="<?php echo $image?>" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                        <h4 class="card-title"><?php echo $row->name?> <?php echo $row->is_partner_verified ? "<a href='#' style='margin-left:5px'><i data-feather='user-check'></i></a>": ''?></h4>
                        <p class="card-text"><?php echo $row->remarks?></p>
                    </div>
                </div>
            </div>
        <?php endforeach?>
    </div>
<?php endbuild()?>  
<?php loadTo()?>