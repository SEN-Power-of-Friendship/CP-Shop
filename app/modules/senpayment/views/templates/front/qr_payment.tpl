{extends file='page.tpl'}

{block name="content"}
    <section id="main" style="margin-bottom: 1.563rem;">
        <div class="row product-container js-product-container">
            <div class="col-md-6">
                {if $QR_GENERATE }
                    <img src="{$QR_GENERATE}" style="width: 100%;" />
                {else}
                    <div style="background: #fff; display: flex; justify-content: center; align-items: center; width: 100%; aspect-ratio: 1/1;">
                        Wrong QR ID!
                    </div>
                {/if}
            </div>
            <div class="col-md-6">
                <div style="display: flex; flex-direction: column;">
                    <h1 style="margin-bottom: 1rem; font-size: x-large;">
                      QR Payment
                    </h1>
                    <div style="display: flex; justify-content: space-between; margin-top: 30px;">
                      <h1>
                        Total
                      </h1>
                      <h1 style="display: flex; justify-content: end;">
                          {$PRICE} THB
                      </h1>
                    </div>
                </div>
                <hr>
                <form method="post" enctype="multipart/form-data">
                    <section class="form-fields">
                        <div class="form-group row" style="margin-bottom: 0;">
                            <div class="col-md-12 col-md-offset-3" style="margin: 15px 0;">
                                <h3>Upload a slip</h3>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12" style="padding: 0 30px;">
                                    <input id="file-upload" type="file" accept="image/png, image/jpeg" name="slip_upload" class="filestyle" data-buttontext="Choose file" tabindex="-1" style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
                                </div>
                            </div>
                        </div>
                    </section>

                    <footer class="form-footer">
                        {if $ERROR}
                            <div style="margin-bottom: 16px; text-align: center; color: red;">
                                {$ERROR}
                            </div>
                        {/if}
                        <button class="btn btn-primary" type="submit" name="placeorder" style="width: 100%;">
                            Upload
                        </button>
                    </footer>
                </form>
            </div>
        </div>
    </section>
{/block}