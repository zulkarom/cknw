<div class="post-content media-body">
    <h4 class="post-title mb-10 text-limit-2-row"><a href="{{url('/issue/' . $edition->id)}}" }}>VOLUME {{ $edition->volume }} ISSUE {{ $edition->issue }} </a></h4>
    <div class="entry-meta meta-1 font-x-small color-grey d-flex">
        <span class="post-on"><i class="ti-timer"></i> {{ $edition->getEditionName() }} </span> 

        <span class="post-on"><i class="ti-file"></i> {{ count($edition->publishedPosts) }} Articles</span>
    </div>
</div>