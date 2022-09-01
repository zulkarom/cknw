@php $maxAuthorCount = 3 @endphp
@php $authors = $options['choices'] @endphp
@php $selected_authors = $options['value'] @endphp
<div class="form-group" id="authors_multi_wrapper" data-emails="" data-max="{{ $maxAuthorCount }}">
    <label class="text-title-field control-label"
            for="authors_multi">Author(s)</label>

            
        @if($selected_authors)
            @foreach($selected_authors as $selected_author)
                <div class="ui-select-wrapper form-group select-author-one">
                <select class="form-control ui-select ui-select" name="authors[]">
                <option value="0">-- Select --</option>

                @if(isset($authors) && (is_array($authors)))
                    @foreach($authors as $value => $author)
                    @php $s = $selected_author == $value ? ' selected' : '' @endphp
                    
                    <option value="{{ $value }}"{{$s}}>{{ $author }}</option>
                    
                    @endforeach
                @endif
                </select>
                    <svg class="svg-next-icon svg-next-icon-size-16">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                    </svg>
                </div>
            @endforeach
        @else
            <div class="ui-select-wrapper form-group select-author-one">
            <select class="form-control ui-select ui-select" name="authors[]">
            <option value="0">-- Select --</option>
            @if(isset($authors) && (is_array($authors)))
                @foreach($authors as $value => $author)
                
                    
                <option value="{{ $value }}">{{ $author }}</option>
                
                @endforeach
            @endif
            </select>
                <svg class="svg-next-icon svg-next-icon-size-16">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#select-chevron"></use>
                </svg>
            </div>
        @endif
        


    

</div>
<a id="add-author" class="link"><small>+ Add Author</small></a> <a id="remove-author" class="link"><small>- Remove Author</small></a>

<br /><br />
