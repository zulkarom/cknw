<?php

namespace Botble\Blog\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;
use Botble\Blog\Http\Requests\EditionRequest;
use Botble\Blog\Models\PostEdition;

class EditionForm extends FormAbstract
{
    /**
     * {@inheritDoc}
     */
    public function buildForm()
    {
        $this
            ->setupModel(new PostEdition())
            ->setValidatorClass(EditionRequest::class)
            ->withCustomFields()
            ->add('volume', 'text', [
                'label'      => 'Volume',
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => 'Volume',
                    'data-counter' => 120,
                ],
            ])
            ->add('issue', 'text', [
                'label'      => 'Issue',
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => 'Issue',
                    'data-counter' => 120,
                ],
            ])
            ->add('status', 'customSelect', [
                'label'      => trans('core/base::tables.status'),
                'label_attr' => ['class' => 'control-label required'],
                'choices'    => BaseStatusEnum::labels(),
            ])
            ->setBreakFieldPoint('status');
    }
}
