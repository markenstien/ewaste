<?php build('content')?>
	<div class="page-wrapper full-page">
    <div class="page-content d-flex align-items-center justify-content-center">
        <div class="row w-100 mx-0 auth-page">
            <div class="col-md-8 col-xl-6 mx-auto">
                <div class="card">
                    <div class="row">
        <div class="col-md-4 pe-md-0">
          <img src="<?php echo mainLogo()?>"
          	style="width:100%">
        </div>
        <div class="col-md-8 ps-md-0">
          <div class="auth-form-wrapper px-4 py-5">
            <h5 class="text-muted fw-normal mb-4">Register An Account</h5>
            <?php Flash::show()?>
            <?php echo $form->getForm()?>
          </div>
        </div>
      </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php endbuild()?>
<?php loadTo('tmp/base')?>


