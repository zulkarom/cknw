<?php

namespace Botble\Blog\Tables;

use BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Blog\Repositories\Interfaces\EditionInterface;
use Botble\Table\Abstracts\TableAbstract;
use Html;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\DataTables;

class EditionTable extends TableAbstract
{
    /**
     * @var bool
     */
    protected $hasActions = true;

    /**
     * @var bool
     */
    protected $hasFilter = true;

    /**
     * TagTable constructor.
     * @param DataTables $table
     * @param UrlGenerator $urlGenerator
     * @param EditionInterface $tagRepository
     */
    public function __construct(DataTables $table, UrlGenerator $urlGenerator, EditionInterface $editionRepository)
    {
        parent::__construct($table, $urlGenerator);

        $this->repository = $editionRepository;

        if (!Auth::user()->hasAnyPermission(['editions.edit', 'editions.destroy'])) {
            $this->hasOperations = false;
            $this->hasActions = false;
        }
    }

    /**
     * {@inheritDoc}
     */
    public function ajax()
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('volume', function ($item) {
                if (!Auth::user()->hasPermission('editions.edit')) {
                    return $item->volume;
                }

                return Html::link(route('editions.edit', $item->id), BaseHelper::clean($item->volume));
            })
            ->editColumn('issue', function ($item) {
                if (!Auth::user()->hasPermission('editions.edit')) {
                    return $item->issue;
                }

                return Html::link(route('editions.edit', $item->id), BaseHelper::clean($item->issue));
            })
            ->editColumn('checkbox', function ($item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('created_at', function ($item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('status', function ($item) {
                if ($this->request()->input('action') === 'excel') {
                    return $item->status->getValue();
                }

                return BaseHelper::clean($item->status->toHtml());
            })
            ->addColumn('operations', function ($item) {
                return $this->getOperations('editions.edit', 'editions.destroy', $item);
            });

        return $this->toJson($data);
    }

    /**
     * {@inheritDoc}
     */
    public function query()
    {
        $query = $this->repository->getModel()->select([
            'id',
            'volume',
            'issue',
            'created_at',
            'status',
        ]);

        return $this->applyScopes($query);
    }

    /**
     * {@inheritDoc}
     */
    public function columns()
    {
        return [
            'id'         => [
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
            ],
            'volume'       => [
                'title' => trans('core/base::tables.volume'),
                'class' => 'text-start',
            ],
            'issue'       => [
                'title' => trans('core/base::tables.issue'),
                'class' => 'text-start',
            ],
            'status'     => [
                'title' => trans('core/base::tables.status'),
                'width' => '100px',
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'width' => '100px',
            ]
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function buttons()
    {
        return $this->addCreateButton(route('editions.create'), 'editions.create');
    }

    /**
     * {@inheritDoc}
     */
    public function bulkActions(): array
    {
        return $this->addDeleteAction(route('editions.deletes'), 'editions.destroy', parent::bulkActions());
    }

    /**
     * {@inheritDoc}
     */
    public function getBulkChanges(): array
    {
        return [
            'volume'       => [
                'title'    => trans('core/base::tables.volume'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'issue'       => [
                'title'    => trans('core/base::tables.issue'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'status'     => [
                'title'    => trans('core/base::tables.status'),
                'type'     => 'customSelect',
                'choices'  => BaseStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type'  => 'date',
            ],
        ];
    }
}
