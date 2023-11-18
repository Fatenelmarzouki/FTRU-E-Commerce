<?php

namespace App\Http\Requests;

use App\Models\Country;
use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class EditpersonalinfoRequest extends FormRequest
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
        $country = [];
        $countries = Country::select('id')->get();
        foreach ($countries as $c) {
            $country[] = $c->id;
        }
        return [
            'name' => 'required|string',
            "email" => "required|email",
            "phone" => "required|numeric|min:10",
            "address" => "string|nullable",
            "image" => "required|image|mimes:jpeg,png,jpg,gif|max:2048|nullable",
            "gender" => ["required", Rule::in(["male", "female"])],
            "country_id" => ["required", Rule::in($country)],
        ];
    }
}