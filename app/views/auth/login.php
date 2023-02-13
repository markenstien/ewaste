<?php build('content')?>
<div class="col-md-5 col-xl-5 mx-auto mt-5 mb-5">
    <div class="card">
      <div class="auth-form-wrapper px-4 py-5">
        <img src="<?php echo mainLogo()?>" style="width:150px;">
        <h5 class="text-muted fw-normal mb-4">Welcome back! Log in to your account.</h5>
        <?php Flash::show()?>
        <?php  __( $form->start() ); ?>
          <div class="mb-3">
            <?php __( $form->getCol('email' , ['required' => true]) ); ?>
          </div>
          <div class="mb-3">
            <?php __( $form->getCol('password') ); ?>
          </div>
          <!-- <div class="form-check mb-3">
            <input type="checkbox" class="form-check-input" id="authCheck">
            <label class="form-check-label" for="authCheck">
              Remember me
            </label>
          </div> -->
          <div>
            <?php __($form->get('submit')) ?>
          </div>
          <div class="row">
            <div class="col"><a href="<?php echo _route('auth:register')?>" class="d-block mt-3 text-muted">Not a user? Sign up</a></div>
            <div class="col"><a href="<?php echo _route('user:resend-verify-registration')?>" class="d-block mt-3 text-muted">Resend Verify Registration</a></div>
          </div>
        <?php __( $form->end() )?>
      </div>
    </div>
</div>
<?php endbuild()?>
<?php loadTo('tmp/public')?>


