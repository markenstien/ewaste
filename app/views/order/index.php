<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Orders</h4>
        </div>
        <div class="card-body">
        <?php foreach($orders as $key => $row) :?>
            <?php $amount = amountHTML($row->net_amount)?>
            <?php echo wTileDefault([
                'image' => $row->items[0]->images[0],
                'title' => date_long($row->created_at),
                'description' => "
                    <ul>
                        <li>Reference : {$row->reference}</li>
                        <li>Customer : {$row->customer_name}</li>
                        <li>Amount : {$amount}</li>
                    </ul>   
                ",
                'href' => _route('order:show', $row->id)
            ])?>
        <?php endforeach?>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>