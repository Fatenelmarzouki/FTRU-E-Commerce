<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;


class EditMainProduct extends FormRequest
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
            'name' => 'required|string',
            'size' => ["required", Rule::in(['S', 'M', 'L', 'XL', 'XXL', 'XXXL', 'ONE SIZE', 'NO SIZE'])],
            'color' => ['regex:/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/'],
            'main_price' => 'required|numeric',
            'main_discount' => 'nullable|numeric',
            'product_code' => 'required|string|max:6|unique:products,product_code',
            'quantity' => 'required|numeric',
            "image" => "image|mimes:jpeg,png,jpg,gif|max:2048|nullable",
            'status' => [Rule::in(['show', 'hide'])],
        ];
    }
}