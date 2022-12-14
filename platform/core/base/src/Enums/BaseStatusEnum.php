<?php

namespace Botble\Base\Enums;

use Botble\Base\Supports\Enum;
use Html;

/**
 * @method static BaseStatusEnum DRAFT()
 * @method static BaseStatusEnum PUBLISHED()
 * @method static BaseStatusEnum SUBMIT()
 * @method static BaseStatusEnum CORRECTION()
 * @method static BaseStatusEnum 
 */
class BaseStatusEnum extends Enum
{
    public const PUBLISHED = 'published';
    public const DRAFT = 'draft';
    public const PENDING = 'pending';
    public const SUBMIT = 'submit';
    public const CORRECTION = 'correction';
    public const REVIEW = 'review';

    /**
     * @var string
     */
    public static $langPath = 'core/base::enums.statuses';

    /**
     * @return string
     */
    public function toHtml()
    {
        switch ($this->value) {
            case self::DRAFT:
                return Html::tag('span', self::DRAFT()->label(), ['class' => 'label-info status-label'])
                    ->toHtml();
            case self::PENDING:
                return Html::tag('span', self::PENDING()->label(), ['class' => 'label-warning status-label'])
                    ->toHtml();
            case self::REVIEW:
                return Html::tag('span', self::REVIEW()->label(), ['class' => 'label-warning status-label'])
                    ->toHtml();
            case self::PUBLISHED:
                return Html::tag('span', self::PUBLISHED()->label(), ['class' => 'label-success status-label'])
                    ->toHtml();
            case self::SUBMIT:
                return Html::tag('span', self::SUBMIT()->label(), ['class' => 'label-primary status-label'])
                    ->toHtml();
            case self::CORRECTION:
                return Html::tag('span', self::CORRECTION()->label(), ['class' => 'label-danger status-label'])
                    ->toHtml();
            default:
                return parent::toHtml();
        }
    }
}
