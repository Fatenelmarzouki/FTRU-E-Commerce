<?php

namespace App\Http\Requests\Admin;

use App\Models\Category;
use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class AddSubCategoryRequest extends FormRequest
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
        $category = [];
        $categories = Category::select('id')->get();
        foreach ($categories as $cat) {
                $category[] = $cat->id;
        }
        return [
            'name'=>'required|string',
            'category_id'=>['required', Rule::in($category)],
        ];
    }
}