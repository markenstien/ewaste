<?php build('content') ?>
    <div class="col-md-5">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Petty Cash</h4>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <tr>
                        <td>Reference :</td>
                        <td><?php echo $pettyCash->reference?></td>
                    </tr>
                    <tr>
                        <td>Staff : </td>
                        <td><?php echo $pettyCash->staff_name?></td>
                    </tr>
                    <tr>
                        <td>Amount : </td>
                        <td><?php echo $pettyCash->amount?></td>
                    </tr>
                    <tr>
                        <td>Entry Type : </td>
                        <td><?php echo $pettyCash->entry_type?></td>
                    </tr>
                    <tr>
                        <td>Description : </td>
                        <td><?php echo $pettyCash->remarks?></td>
                    </tr>
                    <tr>
                        <td>Date : </td>
                        <td><?php echo $pettyCash->date?></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
<?php endbuild()?>
<?php loadTo()?>