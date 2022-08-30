<?php

namespace Botble\Blog\Forms\Fields;

use Kris\LaravelFormBuilder\Fields\FormField;

class AuthorMultiField extends FormField
{
    /**
     * {@inheritDoc}
     */
    protected function getTemplate()
    {
        return 'plugins/blog::categories.authors-multi';
    }
}
