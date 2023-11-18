<?php

namespace App\Http\Requests;

use App\Models\Country;
use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
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
        $country=[];
        $countries=Country::select('id')->get();
        foreach($countries as $c){
            $country[]=$c->id;
        }
        return [
            'name' => 'required|string',
            "email" => "required|email|unique:users,email",
            "phone" => "required|numeric|min:10",
            "address" => "string|nullable",
            "gender"=>["required",Rule::in(["male","female"])],
            "country_id" => ["required", Rule::in($country)],
            "password" => "required|min:10|confirmed",
        ];
    }
    // public function messages()
    // {
    //     return [
    //         'name.required'      => redirect(url('name')),
    //         'email.required'     => 'The email is required.',
    //         'email.unique'       => 'The email must be unique.',
    //         'password.required'  => 'The password is required.',
    //         'password.confirmed' => 'The passwords do not match.',
    //         'password.min'       => 'The password must be at least 8 characters.',
    //         'markets.required'   => 'A market is required.',
    //         'roles.required'     => 'A role is required.',
    //     ];

    // }
}
