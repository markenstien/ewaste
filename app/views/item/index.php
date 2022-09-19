<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Items</h4>
            <?php echo btnCreate(_route('item:create'))?>
            <?php Flash::show()?>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered dataTable">
                    <thead>
                        <th>#</th>
                        <th>SKU</th>
                        <th>Name</th>
                        <th>Sell Price</th>
                        <th>Category</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php foreach($items as $key => $row) :?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->sku?></td>
                                <td><?php echo $row->name?></td>
                                <td><?php echo $row->sell_price?></td>
                                <td><?php echo $row->category_id?></td>
                                <td><?php echo $row->total_stock?></td>
                                <td>
                                    <?php 
                                        $anchor_items = [
                                            [
                                                'url' => _route('item:show' , $row->id),
                                                'text' => 'View',
                                                'icon' => 'eye'
                                            ],

                                            [
                                                'url' => _route('item:edit' , $row->id),
                                                'text' => 'Edit',
                                                'icon' => 'edit'
                                            ]
                                        ];
                                    echo anchorList($anchor_items)?>
                                </td>
                            </tr>
                        <?php endforeach?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>