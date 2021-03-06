<div class="row">
    <div class="col-lg-12">
      <div class="panel panel-default">
          <div class="panel-heading">
              Use Rating Matrix 1 to 5 to Access Performance
          </div>
          <!-- /.panel-heading -->
          <div class="panel-body">
              <div class="table-responsive">
                  <table class="table table-striped">
                      <thead>
                          <tr>
                              <th>#</th>
                              <th>KEY PERFORMANCE AREAS</th>
                              <th>RATE</th>
                           
                          </tr>
                      </thead>
                      <tbody>
                        {section name=y loop=$cwGovernanceData}
                          <tr>
                              <td><input type="hidden" name="cw_preview_size[]">{$cwGovernanceData[y].id_chiefwhip_preview}</td>
                              <td>{$cwGovernanceData[y].chiefwhip_preview_libele}</td>
                              <td class="col-lg-2">
                                {assign var="cw_preview" value=$editData[0].cw_preview}
                                {assign var="constreviewid" value=$cwGovernanceData[y].id_chiefwhip_preview}
                                {capture assign=preview_id}preview_{$constreviewid}{/capture}
                                <select name="preview_{$cwGovernanceData[y].id_chiefwhip_preview}" class="form-control col-lg-2">
                                  {section name=rate start=1 loop=6}
                                    <option value="{$smarty.section.rate.index}" {if $cw_preview.$preview_id eq {$smarty.section.rate.index}} selected="selected"{/if}>{$smarty.section.rate.index}</option>
                                  {/section}
                                </select>
                              </td> 
                          </tr>
                        {/section} 
                      </tbody>
                  </table>
              </div>
              <!-- /.table-responsive -->
          </div>
          <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
    </div>
</div>
<br>
<h4>Overall Performance Rating</h4>
<div class="row">
    <div class="col-lg-12">
      <div class="panel panel-default">
          <div class="panel-heading">
              Use Rating Matrix 1 to 5 to Access Performance
          </div>
          <!-- /.panel-heading -->
          <div class="panel-body">
              <div class="table-responsive">
                  <table class="table table-striped">
                      <thead>
                          <tr>
                            {section name=y loop=$OverPerformanceData}
                              <th>{$OverPerformanceData[y].ovpefrating_libele}</th>
                            {/section}
                          </tr>
                      </thead>
                      <tbody>
                        
                          <tr>
                            {section name=k loop=$OverPerformanceData}
                              <td class="">
                                {assign var="cw_ovpefrating" value=$editData[0].cw_ovpefrating}
                                {assign var="ovpefratingid" value=$OverPerformanceData[k].id_ovpefrating}
                                {capture assign=ovpefrating_id}ovpefrating_{$ovpefratingid}{/capture}
                                <input type="hidden" name="ovpefrating_size[]">
                                <select name="ovpefrating_{$OverPerformanceData[k].id_ovpefrating}" class="form-control col-lg-2">
                                  {section name=rate start=1 loop=6}
                                    <option value="{$smarty.section.rate.index}" {if $cw_ovpefrating.$ovpefrating_id eq {$smarty.section.rate.index}} selected="selected"{/if}>{$smarty.section.rate.index}</option>
                                  {/section}
                                </select>
                              </td> 
                            {/section}
                          </tr>
                        
                      </tbody>
                  </table>
              </div>
              <!-- /.table-responsive -->
          </div>
          <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
    </div>
</div>
<br>



{*{include file="templates-admin/block/submit-buttons.tpl"}*}
<br>
{if $editData[0].id_cw_preview_ass neq ''}
<button type="submit" id="button-update" name="button-update" value="update" class="btn btn-info">Update</button>
{else}
<button type="submit" id="button-insert" name="button-insert" value="Insert" class="btn btn-info">Insert</button>
{/if}

<script type="text/javascript">

/* <![CDATA[ */

  $(document).ready(function() {
    
    $('#editform').validate({
      rules: {      
        "committee[]": { required: true },
        "topic[]": { required: true },
        "strength[]": { required: true },
        "weaknesses[]": { required: true },
        profile_parliament: { required: true },
        id_provincial_legislature: { required: true },
        ancmember_branch: { required: true },
        ancmember_number: { required: true },
        ancmember_province: { required: true },
        ancmember_region: { required: true },
        first_name: { required: true },
        last_name: { required: true },
        email_address: { email:true },      
        id_administratortype: { required: true },
        password: { required: false, minlength: 6 },
        confirm_password: { required: false, minlength: 6, equalTo: '#password'}
      },

      messages: {     
        "committee[]": { required: 'Enter a Committee... at least one' },
        "topic[]": { required: 'Enter a topic... at least one' },
        "strength[]": { required: 'Please enter a your strength... at least one' },
        "weaknesses[]": { required: 'Please enter your weaknesses... at least one' },
        profile_parliament: { required: 'Please tick parliament member' },
        id_provincial_legislature: { required: 'please select your Provincial Legislature' },
        ancmember_number: { required: 'please enter your Membership Number' },
        ancmember_branch: { required: 'please enter your Branch name' },
        ancmember_province: { required: 'please select your member province' },
        ancmember_region: { required: 'please enter your Region' },
        first_name: { required: 'Please enter your First Name' },
        last_name: { required: 'Please enter your Last Name' },
        email_address: { required: 'Please enter your Email Address' },         
        id_administratortype: { required: 'Please select Adminstrator Type' },
        password: { required: 'Please enter your Password' },
        confirm_password: { required: 'Please confirm your Password', equalTo: 'Your password and confirmation password must match' }
      }
    });

    $("#id_administratortype").change( function() {
      
      if( $("#id_administratortype").val() == 1 ) $("input[name='id_administratoraccess[]']").each(function() { this.checked = true; });  
      else $("input[name='id_administratoraccess[]']").each(function() { this.checked = false; });
    });

    {if $pageObject->id eq ''}
      $("#password").rules("add", { required:true,minlength:6 });
      $("#confirm_password").rules("add", { required:true,minlength:6,equalTo: "#password" });
    {/if}

    {if $editData[0].id_administratortype eq '1'}
      $("input[name='id_administratoraccess[]']").each(function() { this.checked = true; });
    {/if}

    
    $('#button-insertasnew, #button-insertasnew_a, #button-insertasnew_b').click(function() {  
      $("#password").rules("add", { required:true,minlength:6 });
      $("#confirm_password").rules("add", { required:true,minlength:6,equalTo: "#password" });
    }); 
    
    $('#button-update, #button-update_a, #button-update_b').click(function() {
      if( $("#password").val() == '' && $("#confirm_password").val() == '' ) {
        $("#password").rules("remove");
        $("#confirm_password").rules("remove");   
      }     
    });

  });
/* ]]> */
</script>