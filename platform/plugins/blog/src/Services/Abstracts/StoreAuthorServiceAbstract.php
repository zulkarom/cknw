<?php

namespace Botble\Blog\Services\Abstracts;

use Botble\Blog\Models\Post;
//use Botble\Blog\Repositories\Interfaces\AuthorInterface;
use Botble\Member\Repositories\Interfaces\MemberInterface;
use Illuminate\Http\Request;

abstract class StoreAuthorServiceAbstract
{
    /**
     * @var AuthorInterface
     */
    protected $authorRepository;

    /**
     * StoreCategoryServiceAbstract constructor.
     * @param CategoryInterface $categoryRepository
     */
    public function __construct(MemberInterface $authorRepository)
    {
        $this->authorRepository = $authorRepository;
    }

    /**
     * @param Request $request
     * @param Post $post
     * @return mixed
     */
    abstract public function execute(Request $request, Post $post);
}
