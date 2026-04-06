<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ProjectStatusUpdated extends Notification
{
    use Queueable;

    protected $project;

    /**
     * Create a new notification instance.
     */
    public function __construct($project)
    {
        $this->project = $project;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail', 'database'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
                    ->subject('Mise à jour de votre projet : ' . $this->project->name)
                    ->greeting('Bonjour ' . $notifiable->name . ',')
                    ->line('Le statut de votre projet "' . $this->project->name . '" a été mis à jour.')
                    ->line('Nouveau statut : **' . $this->project->status . '**')
                    ->line('Progression actuelle : **' . $this->project->progress . '%**')
                    ->action('Consulter le projet', url('/projects/' . $this->project->id))
                    ->line('Merci de votre confiance !');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            'project_id' => $this->project->id,
            'project_name' => $this->project->name,
            'status' => $this->project->status,
            'progress' => $this->project->progress,
            'message' => 'Le statut de votre projet a été mis à jour.',
        ];
    }
}
