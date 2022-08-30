<?php

namespace Botble\Blog\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Support\Collection;

interface AuthorInterface extends RepositoryInterface
{
    /**
     * @return array
     */
    public function getDataSiteMap();

    /**
     * @param array $condition
     * @param array $with
     * @return array
     */
    public function getAllAuthors(array $condition = [], array $with = []);

    /**
     * @param int $id
     * @return mixed
     */
    public function getAuthorById($id);

    /**
     * @param array $select
     * @param array $orderBy
     * @return Collection
     */
    public function getAuthors(array $select, array $orderBy);

    /**
     * @param array $filters
     * @return mixed
     */
    public function getFilters($filters);

}
