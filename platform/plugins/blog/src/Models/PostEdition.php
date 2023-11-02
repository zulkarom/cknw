<?php

namespace Botble\Blog\Models;

use Botble\Base\Traits\EnumCastable;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class PostEdition extends BaseModel
{
    use EnumCastable;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'post_editions';

    /**
     * The date fields
     *
     * @var array
     */
    protected $dates = [
        'created_at',
        'updated_at',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'volume',
        'issue',
        'status'
    ];

    /**
     * @var array
     */
    protected $casts = [
        'status' => BaseStatusEnum::class,
    ];

    /**
     * @return HasMany
     */
    public function posts(): HasMany
    {
        return $this->hasMany(Post::class, 'edition_id');
    }

    public function publishedPosts(): HasMany
    {
        return $this->hasMany(Post::class, 'edition_id')
        ->where('status', BaseStatusEnum::PUBLISHED());
    }

    protected static function boot()
    {
        parent::boot();

        self::deleting(function (PostEdition $postEdition) {
            $postEdition->posts()->detach();
        });
    }

     /**
     * @return string
     * @deprecated
     */
    public function getEditionName()
    {
        return 'Volume ' . $this->volume . ' Issue ' . $this->issue;
    }
}
