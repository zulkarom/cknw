<?php

namespace Botble\Blog\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface EditionInterface extends RepositoryInterface
{
    /**
     * @return array
     */
    public function getDataSiteMap();

    /**
     * @param int $limit
     * @param array|string[] $with
     * @param array $withCount
     * @return mixed
     */
    public function getPopularEditions($limit, array $with = ['slugable'], array $withCount = ['posts']);

    /**
     * @param bool $active
     * @return array
     */
    public function getAllEditions($active = true);
}
