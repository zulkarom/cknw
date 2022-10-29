
<div class="form-group mb-3">
    <label class="control-label">{{ __('Number of posts') }}</label>
    <input name="limit" class="form-control" value="{{ Arr::get($attributes, 'limit', 3) }}">
</div>
