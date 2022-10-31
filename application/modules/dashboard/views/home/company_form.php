  <div class="row">
      <div class="col-sm-12">
          <div class="panel panel-bd lobidrag">
              <div class="panel-heading">
                  <div class="panel-title">
                      <h4><?php echo display('company_edit') ?> </h4>
                  </div>
              </div>
              <?php echo form_open_multipart('dashboard/setting/company_update',array('class' => 'form-vertical', 'id' => 'update_company'))?>
              <div class="panel-body">

                  <div class="form-group row">
                      <label for="company_name" class="col-sm-3 col-form-label"><?php echo display('name') ?> <i
                              class="text-danger">*</i></label>
                      <div class="col-sm-6">
                          <input type="text" tabindex="2" class="form-control" name="company_name"
                              value="<?php echo $companys->company_name?>"
                              placeholder="<?php echo display('company_name') ?>" required tabindex="1" />
                      </div>
                  </div>

                  <div class="form-group row">
                      <label for="bank_name" class="col-sm-3 col-form-label"><?php echo display('mobile') ?> <i
                              class="text-danger">*</i></label>
                      <div class="col-sm-6">
                          <input type="number" tabindex="3" class="form-control" name="mobile" name="mobile"
                              value="<?php echo $companys->mobile?>" placeholder="<?php echo display('mobile') ?>"
                              required tabindex="2" />
                      </div>
                  </div>

                  <div class="form-group row">
                      <label for="address" class="col-sm-3 col-form-label"><?php echo display('address') ?> <i
                              class="text-danger">*</i></label>
                      <div class="col-sm-6">
                          <textarea class="form-control input-description" tabindex="3" id="adress" name="address"
                              placeholder="<?php echo display('address') ?>"
                              required><?php echo $companys->address?></textarea>
                      </div>
                  </div>

                  <div class="form-group row">
                      <label for="email" class="col-sm-3 col-form-label"><?php echo display('email') ?> <i
                              class="text-danger">*</i></label>
                      <div class="col-sm-6">
                          <input type="email" tabindex="3" class="form-control" value="<?php echo $companys->email?>"
                              name="email" placeholder="<?php echo display('email') ?>" required tabindex="4" />
                      </div>
                  </div>

                  <div class="form-group row">
                      <label for="bank_name" class="col-sm-3 col-form-label"><?php echo display('website') ?> <i
                              class="text-danger">*</i></label>
                      <div class="col-sm-6">
                          <input type="url" tabindex="3" class="form-control" value="<?php echo $companys->website?>"
                              name="website" placeholder="<?php echo display('website') ?>" required tabindex="5" />
                      </div>
                  </div>
                  <div class="form-group row">
                      <label for="bank_name" class="col-sm-3 col-form-label"><?php echo display('vat_no') ?> </label>
                      <div class="col-sm-6">
                          <input type="text" tabindex="3" class="form-control" value="<?php echo $companys->vat_no?>"
                              name="vat_no" placeholder="<?php echo display('vat_no') ?>" tabindex="5" />
                      </div>
                  </div>
                  <div class="form-group row">
                      <label for="bank_name" class="col-sm-3 col-form-label"><?php echo display('cr_no') ?> &nbsp;
                          <span data-toggle="tooltip" data-placement="top" title="Commercial Registration Number">
                            <i class="fa fa-question-circle" aria-hidden="true"></i>
                          </span>
                        </label>
                      <div class="col-sm-6">
                          <input type="text" tabindex="3" class="form-control" value="<?php echo $companys->cr_no?>"
                              name="cr_no" placeholder="<?php echo display('cr_no') ?>" tabindex="5" />
                      </div>
                  </div>

                  <input type="hidden" name="company_id" value="<?php echo $companys->company_id?>" />

                  <div class="form-group row">
                      <label for="example-text-input" class="col-sm-4 col-form-label"></label>
                      <div class="col-sm-6">
                          <input type="submit" id="add-company" class="btn btn-success btn-large" name="add-company"
                              value="<?php echo display('save_changes') ?>" tabindex="6" />
                      </div>
                  </div>
              </div>
              <?php echo form_close()?>
          </div>
      </div>
  </div>