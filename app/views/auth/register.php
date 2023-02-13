<?php build('content')?>
<div class="col-md-5 col-xl-5 mx-auto mt-5 mb-5">
  <div class="card">
    <div class="auth-form-wrapper px-4 py-5">
      <img src="<?php echo mainLogo()?>" style="width:150px;">
      <h5 class="text-muted fw-normal mb-4">Register An Account</h5>
      <?php Flash::show()?>
      <?php echo $form->getForm()?>
    </div>
  </div>
</div>
<?php endbuild()?>
<?php loadTo('tmp/public')?>


