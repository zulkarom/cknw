@php $maxAuthorCount = 3 @endphp
<div class="form-group" id="authors_multi_wrapper" data-emails="" data-max="{{ $maxAuthorCount }}">
    <label class="text-title-field"
            for="authors_multi"></label>

            <div class="ui-select-wrapper form-group select-author-one">
        <select class="form-control ui-select ui-select" id="author_id" name="authors[]">
        <option value="">-- Select --</option>
            
        @if(isset($options['choices']) && (is_array($options['choices'])))
        @php $authors = $options['choices'] @endphp
            @foreach($authors as $value => $author)

            <option value="{{ $value }}">{{ $author }}</option>

            @endforeach
            
        @endif
        </select>
    <svg class="svg-next-icon svg-next-icon-size-16">
        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
    </svg>
</div>


    

</div>
<a id="add-author" class="link"><small>+ Add Author</small></a> <a id="remove-author" class="link"><small>- Remove Author</small></a>
@php 

@endphp