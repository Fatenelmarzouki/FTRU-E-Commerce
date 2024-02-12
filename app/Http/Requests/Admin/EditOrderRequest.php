<?php

namespace App\Http\Requests\Admin;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class EditOrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'discount'=> 'required|numeric',
            'shipping'=> 'required|numeric',
            'tax'=> 'required|numeric',
            "status" => ["required", Rule::in('Processing', 'Shipped', 'Delivered', 'Pending')],
        ];
    }
}