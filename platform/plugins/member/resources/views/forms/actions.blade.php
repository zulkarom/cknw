<div class="widget meta-boxes form-actions form-actions-default action-{{ $direction ?? 'horizontal' }}">
    <div class="widget-title">
        <h4>
            @if (isset($icon) && !empty($icon))
                <i class="{{ $icon }}"></i>
            @endif
            <span>{{ isset($title) ? $title : apply_filters(BASE_ACTION_FORM_ACTIONS_TITLE, trans('core/base::forms.publish')) }}</span>
        </h4>
    </div>
    <div class="widget-body">
        <div class="btn-set">
            @php do_action(BASE_ACTION_FORM_ACTIONS, 'default') @endphp
            <button type="submit" name="submit" value="apply" class="btn btn-sm btn-info">
                <i class="fa fa-save"></i> {{ trans('core/base::forms.save') }}
            </button>
                &nbsp;
                <button type="button" id="btn-submit" class="btn btn-sm btn-success">
                    <i class="fa fa-check-circle"></i> Submit
                </button>
        </div>
    </div>
</div>

<div class="modal fade modal-member-submit" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h4 class="modal-title"><i class="til_img"></i><strong>Confirm Submit Post</strong></h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true">

                </button>
            </div>

            <div class="modal-body with-padding">
                <div>Do you really want to submit this post?</div>
            </div>

            <div class="modal-footer">
                <button type="button" class="float-start btn btn-warning" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" name="submit" value="save" class="float-end btn btn-success" >Submit</button>
            </div>
        </div>
    </div>
</div>
<!-- end Modal -->