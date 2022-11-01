@php $category = $post->categories->first(); @endphp
<div class="row">
    <div class="col-md-6">

    <div class="post-thumb mb-30 border-radius-5 img-hover-scale animate-conner-box">
    <a href="{{ get_external_link($post) }}" {{ is_external_link($post) ? 'target="_blank"' : '' }}>
        <img class="lazy" style="width: 100%"
            data-src="{{ RvMedia::getImageUrl($post->image, 'medium', false, RvMedia::getDefaultImage()) }}"
            src="{{ RvMedia::getImageUrl(theme_option('img_loading')) }}"
            alt="{{ $post->name }}">
    </a>

    <ul class="social-share">
        <li><a href="#"><i class="ti-sharethis"></i></a></li>
        {!! Theme::partial('components.social-share-post-simple', compact('post')) !!}
    </ul>
</div>
    </div>

</div>

<div class="post-content">

    <h4 class="post-title">
        <a href="{{ get_external_link($post) }}" {{ is_external_link($post) ? 'target="_blank"' : '' }}>{{ $post->name }}</a>
    </h4>

    @if(!isset($showDescription) || !empty($showDescription))
        <div class="post-excerpt mb-25">
            <p>{!! clean($post->description) !!}</p>
        </div>
    @endif
    <p>
    @if(isset($showReadMoreText) ? $showReadMoreText : true)
            @if(!is_plugin_active('external-source'))
                <a class="readmore-btn font-small text-uppercase font-weight-ultra" href="{{ $post->url }}">
                    {{ __('Read More') }}
                    <i class="ti-arrow-right ml-5 transition-02s"></i>
                </a>
            @endif
        @endif
    </p>
</div>

<div class="bt-1 border-color-1 mt-30 mb-50"></div>
