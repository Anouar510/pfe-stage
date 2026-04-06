<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactFormMail;

class ContactController extends Controller
{
    public function send(Request $request)
    {
        $validated = $request->validate([
            'subject' => 'required|string',
            'message' => 'required|string',
        ]);

        $user = auth()->user();
        
        // Send email to admin (configure MAIL_FROM_ADDRESS in .env)
        // or a specific admin email
        $adminEmail = env('MAIL_FROM_ADDRESS', 'admin@bakkah.immo');

        try {
            Mail::to($adminEmail)->send(new ContactFormMail($user, $validated['subject'], $validated['message']));
            return response()->json(['message' => 'Message envoyé avec succès !']);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Erreur lors de l\'envoi du message.', 'error' => $e->getMessage()], 500);
        }
    }
}
