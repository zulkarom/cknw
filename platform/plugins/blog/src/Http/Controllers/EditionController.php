<?php

namespace Botble\Blog\Http\Controllers;

use Botble\ACL\Models\User;
use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Botble\Blog\Forms\EditionForm;
use Botble\Blog\Http\Requests\EditionRequest;
use Botble\Blog\Repositories\Interfaces\EditionInterface;
use Botble\Blog\Tables\EditionTable;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\View\View;
use Throwable;

class EditionController extends BaseController
{
    use HasDeleteManyItemsTrait;

    /**
     * @var EditionInterface
     */
    protected $editionRepository;

    /**
     * @param EditionInterface $editionRepository
     */
    public function __construct(EditionInterface $editionRepository)
    {
        $this->editionRepository = $editionRepository;
    }

    /**
     * @param EditionTable $dataTable
     * @return Factory|View
     *
     * @throws Throwable
     */
    public function index(EditionTable $dataTable)
    {
        page_title()->setTitle(trans('plugins/blog::editions.menu'));

        return $dataTable->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('plugins/blog::editions.create'));

        return $formBuilder->create(EditionForm::class)->renderForm();
    }

    /**
     * @param EditionRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function store(EditionRequest $request, BaseHttpResponse $response)
    {
        $edition = $this->editionRepository->createOrUpdate($request->input());
        event(new CreatedContentEvent(EDITION_MODULE_SCREEN_NAME, $request, $edition));

        return $response
            ->setPreviousUrl(route('editions.index'))
            ->setNextUrl(route('editions.edit', $edition->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * @param int $id
     * @param Request $request
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder, Request $request)
    {
        $edition = $this->editionRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $edition));

        page_title()->setTitle(trans('plugins/blog::editions.edit') . ' V' . $edition->volume . '  I' . $edition->issue);

        return $formBuilder->create(EditionForm::class, ['model' => $edition])->renderForm();
    }

    /**
     * @param int $id
     * @param EditionRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, EditionRequest $request, BaseHttpResponse $response)
    {
        $edition = $this->editionRepository->findOrFail($id);
        $edition->fill($request->input());

        $this->editionRepository->createOrUpdate($edition);
        event(new UpdatedContentEvent(EDITION_MODULE_SCREEN_NAME, $request, $edition));

        return $response
            ->setPreviousUrl(route('editions.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param Request $request
     * @param int $id
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function destroy($id, Request $request, BaseHttpResponse $response)
    {
        try {
            $edition = $this->editionRepository->findOrFail($id);
            $this->editionRepository->delete($edition);

            event(new DeletedContentEvent(EDITION_MODULE_SCREEN_NAME, $request, $edition));

            return $response->setMessage(trans('plugins/blog::editions.deleted'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage(trans('plugins/blog::editions.cannot_delete'));
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     *
     * @throws Exception
     */
    public function deletes(Request $request, BaseHttpResponse $response)
    {
        return $this->executeDeleteItems($request, $response, $this->editionRepository, EDITION_MODULE_SCREEN_NAME);
    }

    /**
     * Get list editions in db
     *
     * @return array
     */
    public function getAllEditions()
    {
        return $this->editionRepository->pluck('id');
    }
}
