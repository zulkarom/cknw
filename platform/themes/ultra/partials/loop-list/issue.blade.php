
            <div class="col-lg-10 col-md-12">


            @if(!empty($posts) && $posts->total() > 0)
        <div class="loop-list loop-list-1">

        @if($posts->first())
                <article class="first-post mb-50 animate-conner">
                    {!! Theme::partial('components.post-card-1-block-editor', ['post' => $posts->first()]) !!}
                </article>
            @endif


            @foreach($posts->slice(1) as $post)
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
