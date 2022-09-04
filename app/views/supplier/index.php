<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Suppliers</h4>
            <?php echo btnCreate(_route('supplier:create'))?>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table-bordered table dataTable">
                    <thead>
                        <th>#</th>
                        <th>Name</th>
                        <th>Product</th>
                        <th>Remarks</th>
                        <th>Contact Person</th>
                        <th>Action</th>
                    </thead>

                    <tbody>
                        <?php foreach($suppliers as $key => $row) :?>
                            <tr>
                                <td><?php echo ++$key?></td>
                                <td><?php echo $row->name?></td>
                                <td><?php echo $row->product?></td>
                                <td><?php echo $row->remarks?></td>
                                <td><?php echo $row->contact_person_name?></td>
                                <td>
                                    <?php 
										$anchor_items = [
											[
												'url' => _route('supplier:show' , $row->id),
												'text' => 'View',
												'icon' => 'eye'
											],

											[
												'url' => _route('supplier:edit' , $row->id),
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