<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreProjectRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return $this->user()->role === 'admin';
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'user_id' => 'required|exists:users,id',
            'name' => 'required|string|max:255',
            'location' => 'required|string|max:255',
            'progress' => 'required|integer|min:0|max:100',
            'status' => 'required|string|max:100',
            'image_path' => 'nullable|string',
            'document_path' => 'nullable|file|mimes:pdf,doc,docx,jpg,png|max:10240',
            'total_value' => 'required|numeric',
            'delivery_date' => 'required|date',
        ];
    }
}
