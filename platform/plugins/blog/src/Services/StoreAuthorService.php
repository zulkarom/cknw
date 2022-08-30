<?php

namespace Botble\Blog\Services;

use Botble\Blog\Models\Post;
use Botble\Blog\Services\Abstracts\StoreAuthorServiceAbstract;
use Illuminate\Http\Request;

class StoreAuthorService extends StoreAuthorServiceAbstract
{
    /**
     * @param Request $request
     * @param Post $post
     * @return mixed|void
     */
    public function execute(Request $request, Post $post)
    {
        $authors = $request->input('authors');
        if (!empty($authors) && is_array($authors)) {
            $post->authors()->sync($authors);
        }
    }
}
