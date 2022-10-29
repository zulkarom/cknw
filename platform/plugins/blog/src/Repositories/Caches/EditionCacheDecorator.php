<?php

namespace Botble\Blog\Repositories\Caches;

use Botble\Blog\Repositories\Interfaces\EditionInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

class EditionCacheDecorator extends CacheAbstractDecorator implements EditionInterface
{
    /**
     * {@inheritDoc}
     */
    public function getDataSiteMap()
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    /**
     * {@inheritDoc}
     */
    public function getPopularEditions($limit, array $with = ['slugable'], array $withCount = ['posts'])
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    /**
     * {@inheritDoc}
     */
    public function getRecentEditions($active = true, $limit)
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    /**
     * {@inheritDoc}
     */
    public function getAllEditions($active = true)
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
