<?php build('content') ?>
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Supplier</h4>
            <?php echo btnList(_route('supplier:index'))?>
        </div>

        <div class="card-body">
            <div class="row">
                <div class="col-md-5">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <tr>
                                <td>Name : </td>
                                <td><?php echo $supplier->name?></td>
                            </tr>
                            <tr>
                                <td>Product : </td>
                                <td><?php echo $supplier->product?></td>
                            </tr>
                            <tr>
                                <td colspan="2">Contact Person</td>
                            </tr>
                            <tr>
                                <td>Name : </td>
                                <td><?php echo $supplier->contact_person_name?></td>
                            </tr>
                            <tr>
                                <td>Phone : </td>
                                <td><?php echo $supplier->contact_person_number?></td>
                            </tr>
                            <tr>
                                <td>Status : </td>
                                <td><?php echo $supplier->status?></td>
                            </tr>
                            <tr>
                                <td>Start Date : </td>
                                <td><?php echo $supplier->date_start?></td>
                            </tr>
                            <tr>
                                <td>Remarks : </td>
                                <td><?php echo $supplier->remarks?></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>