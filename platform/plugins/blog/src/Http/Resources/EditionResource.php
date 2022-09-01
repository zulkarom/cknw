<?php

namespace Botble\Blog\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EditionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'          => $this->id,
            'volume'        => $this->volume,
            'issue' => $this->issue,
            'slug'        => $this->slug
            
        ];
    }
}
