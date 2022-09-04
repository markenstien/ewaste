<?php build('content')?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Stocks</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <th>#</th>
                        <th>Sku</th>
                        <th>Name</th>
                        <th>Min</th>
                        <th>Max</th>
                        <th>Stocks</th>
                        <th>Stock Level</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php foreach ($stocks as $key => $row) :?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->sku?></td>
                                <td><?php echo $row->name?></td>
                                <td><?php echo $row->min_stock?></td>
                                <td><?php echo $row->max_stock?></td>
                                <td><?php echo $row->total_stock?></td>
                                <td><?php echo $row->stock_level?></td>
                                <td>
                                    <a href="<?php echo _route('stock:create',null,[
                                        'csrfToken' => csrfGet(),
                                        'item_id'   => $row->id
                                    ])?>">Manage Stock</a> | 

                                    <a href="<?php echo _route('stock:log',null,[
                                        'item_id' => $row->id
                                    ])?>">Logs</a>
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