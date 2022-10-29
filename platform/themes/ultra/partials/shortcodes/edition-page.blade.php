
{{ $edition = app('request')->input('edition') }}

@php 
$posts = get_posts_by_edition($edition);
@endphp

<main class="position-relative">
    <div class="main_content pb-50 pt-50">
<div class="page-header page-header-style-1 text-center">
            <div class="container">
                <h1><span class="color2">Volume # Issues #</span></h1>
            

                <div class="bt-1 border-color-1 mt-30 mb-50"></div>
            </div>
        </div>

<!-- Recent Edition Start -->
<div class="recent-area pt-50 pb-50 {{ $shortcode->background_style }}">
    <div class="container">
        <div class="row">
            <div class="col-lg-10 col-md-12">
        @php 
        $posts = get_posts_by_edition($edition);
        @endphp

            @if(!empty($posts) && $posts->total() > 0)
        <div class="loop-list loop-list-1">


            @foreach($posts as $post)
                <article class="row mb-50">
                    {!! Theme::partial('components.post-card-2-block-long', ['post' => $post]) !!}
                </article>
            @endforeach
        </div>

        <!--pagination-->
        <div class="pagination-area pt-30 text-center bt-1 border-color-1">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="single-wrap d-flex justify-content-center">
                            @if($posts)
                                {!! $posts->withQueryString()->links() !!}
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @else
        <p class="text-center">{{ __('No posts') }}</p>
    @endif


            </div>

            
        </div>
    </div>
</div>
<!-- Recent Edition End -->

    </div></main>
