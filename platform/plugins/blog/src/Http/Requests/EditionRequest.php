<?php

namespace Botble\Blog\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class EditionRequest extends Request
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'volume'        => 'required|max:120',
            'issue' => 'required|max:120',
            'status'      => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
