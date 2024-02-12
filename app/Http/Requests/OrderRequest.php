<?php

namespace App\Http\Requests;
use App\Models\Country;
use Illuminate\Validation\Rule;

use Illuminate\Foundation\Http\FormRequest;

class OrderRequest extends FormRequest
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
            "email" => "required|email",
            "phone" => "required|numeric|min:10",
            "country_id" => ["required", Rule::in($country)],
            'state'=> 'required|string',
            'city'=>'required|string',
            'street_number'=>'required|string',
            'address_line1'=>'required|string',
            'address_line2'=>'required|string',
            'unit_number'=>'required|string',
        ];
    }
}