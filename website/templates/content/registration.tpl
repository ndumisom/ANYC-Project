 <div class="container">
        <div class="row">
            <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">ANC Councillor's Registration</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                  {if isset($registrationFormErrormsg)}
                  <div id="notification" style="display: block;" class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button> <strong>Oh snap!</strong> {$registrationFormErrormsg}</div>
                  {/if}
                    <div id="notificationEdit">
                                                </div>
                  <div class="panel panel-default">
                      {*<div class="panel-heading">
                          fabricant Détails
                      </div>*}
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-lg-6">
                                  <form role="form" id="editform" action="" method="post" enctype="multipart/form-data">
                                      <div class="form-group">
                                          <label>First name</label>
                                           <input class="form-control" placeholder="First name" id="first_name" name="first_name" type="text" value="" autofocus="">
                                           <span class="validate-error"></span>
                                      </div>

                                      <div class="form-group">
                                          <label>Last name</label>
                                           <input class="form-control" placeholder="Last name" id="last_name" name="last_name" type="text" value="" autofocus="">
                                           <span class="validate-error"></span>
                                      </div>

                                      <div class="form-group">
                                          <label>Email Address</label>
                                           <input class="form-control" placeholder="Email Address" id="email_address" name="email_address" type="text" value="" autofocus="">
                                           <span class="validate-error"></span>
                                      </div>

                                      <div class="form-group">
                                          <label>Password</label>
                                           <input class="form-control" placeholder="password" id="password" name="password" type="password" value="" autofocus="">
                                           <span class="validate-error"></span>
                                      </div>


                                      <div class="form-group">
                                          <label>Confirm Password</label>
                                           <input class="form-control" placeholder="confirm password" id="confirm_password" name="confirm_password" type="password" value="" autofocus="">
                                           <span class="validate-error"></span>
                                      </div>
                                      <button type="submit" id="button-insert" name="button-insert" value="Insert" class="btn btn-success">Submit</button>
                                       <a href="/" id="button-back" class="btn btn-warning">Back to Login</a> 

<script type="text/javascript">
/* <![CDATA[ */
    $(document).ready(function() {
    $('#editform').validate({

            rules: {
        first_name: { required: true },
        last_name: { required: true },
        email_address: { required: true, email: true },
        password: { required: true, minlength: 6 },
        confirm_password: { required: false, minlength: 6, equalTo: '#password'}
            },
            messages: {     
        first_name: { required: 'Please enter your first name' },
        last_name: { required: 'Please enter your last name' },
        email_address: { required: 'Please enter your email address', email: 'Please enter a valid email address' },
        password: { required: 'Please enter your password' },
        confirm_password: { required: 'Please confirm your Password', equalTo: 'Your password and confirmation password must match' }
            }
        });

    });


/* ]]> */
</script>

                                      <input type="hidden" id="editform-action" name="editform-action" value="">    
                                      <input type="hidden" id="viewmode" name="viewmode" value="">
                                      <input type="hidden" id="id_form" name="id_form" value="">
                                  </form>
                              </div>
                              <!-- /.col-lg-6 (nested) -->
                          </div>
                          <!-- /.row (nested) -->
                      </div>
                      <!-- /.panel-body -->
                  </div>
                  <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        </div>
    </div>
