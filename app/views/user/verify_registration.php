<?php build('content') ?>
<div class="col-md-8 col-xl-6 mx-auto mt-5">
    <div class="card">
        <div class="row">
          <div class="col-md-4 pe-md-0">
            <img src="<?php echo mainLogo()?>"
              style="width:100%">
          </div>
          <div class="col-md-8 ps-md-0">
            <div class="auth-form-wrapper px-4 py-5">
              <h5 class="text-muted fw-normal mb-4">Re-confirm your registration</h5>
              <?php Flash::show()?>
              <?php  __( $form->start() ); ?>
                <div class="mb-3">
                  <?php __( $form->getCol('email' , ['required' => true]) ); ?>
                </div>
                <div>
                  <?php __($form->get('submit')) ?>
                </div>
                <a href="<?php echo _route('auth:register')?>" class="d-block mt-3 text-muted">Not a user? Sign up</a>
              <?php __( $form->end() )?>
            </div>
          </div>
        </div>
    </div>
</div>
<?php endbuild()?>
<?php loadTo('tmp/public')?>