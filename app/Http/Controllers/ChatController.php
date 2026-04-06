<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Project;

class ChatController extends Controller
{
    public function ask(Request $request)
    {
        $message = $request->input('message');

        if (!$message) {
            return response()->json(['answer' => 'Message vide.'], 400);
        }

        $query = mb_strtolower(trim($message));

        // Charger les projets depuis la base de données
        $projects = Project::with('steps')->get();

        // Générer la réponse
        $reply = $this->generateResponse($query, $projects);

        return response()->json(['answer' => $reply]);
    }

    private function generateResponse(string $query, $projects): string
    {
        // ========== SALUTATIONS ==========
        if ($this->matchesAny($query, ['bonjour', 'salut', 'hello', 'hi', 'hey', 'bonsoir', 'coucou', 'salam', 'yo'])) {
            return "Bonjour et bienvenue ! Je suis l'assistant virtuel de **Bakkah Immobilier**. Je peux vous renseigner sur :\n\n" .
                   "- **Nos projets** en cours et leur avancement\n" .
                   "- **Notre entreprise** et nos valeurs\n" .
                   "- **Nos coordonnees** de contact\n" .
                   "- **Le tableau de bord** et ses fonctionnalites\n\n" .
                   "Comment puis-je vous aider ?";
        }

        // ========== REMERCIEMENTS ==========
        if ($this->matchesAny($query, ['merci', 'thanks', 'thank', 'shukran', 'choukran'])) {
            return "Je vous en prie ! N'hesitez pas si vous avez d'autres questions. Je suis la pour vous aider.";
        }

        // ========== AU REVOIR ==========
        if ($this->matchesAny($query, ['au revoir', 'bye', 'bbye', 'à bientôt', 'a bientot', 'ciao', 'bslama'])) {
            return "Au revoir et a bientot ! L'equipe Bakkah Immobilier reste a votre disposition.";
        }

        // ========== PROJET SPÉCIFIQUE ==========
        if ($this->matchesAny($query, ['projet', 'projets', 'construction', 'chantier', 'immeuble', 'villa', 'appartement', 'résidence', 'residence'])) {
            // Vérifier si un projet spécifique est demandé
            foreach ($projects as $project) {
                $projectName = mb_strtolower($project->name);
                if (str_contains($query, $projectName) || $this->fuzzyMatch($query, $projectName)) {
                    return $this->formatProjectDetail($project);
                }
            }

            // Chercher par localisation
            foreach ($projects as $project) {
                $location = mb_strtolower($project->location ?? '');
                if ($location && str_contains($query, $location)) {
                    return $this->formatProjectDetail($project);
                }
            }

            // Liste tous les projets
            return $this->formatProjectsList($projects);
        }

        // ========== AVANCEMENT / PROGRESSION ==========
        if ($this->matchesAny($query, ['avancement', 'progression', 'progress', 'avance', 'pourcentage', 'etat', 'état', 'statut', 'status'])) {
            foreach ($projects as $project) {
                $projectName = mb_strtolower($project->name);
                if (str_contains($query, $projectName) || $this->fuzzyMatch($query, $projectName)) {
                    return $this->formatProjectProgress($project);
                }
            }
            return $this->formatAllProgress($projects);
        }

        // ========== ÉTAPES ==========
        if ($this->matchesAny($query, ['etape', 'étape', 'etapes', 'étapes', 'phase', 'phases', 'timeline'])) {
            foreach ($projects as $project) {
                $projectName = mb_strtolower($project->name);
                if (str_contains($query, $projectName) || $this->fuzzyMatch($query, $projectName)) {
                    return $this->formatProjectSteps($project);
                }
            }
            return "Pour quel projet souhaitez-vous connaitre les etapes ? Voici nos projets :\n\n" .
                   $projects->map(fn($p) => "- **{$p->name}**")->join("\n");
        }

        // ========== LIVRAISON / DATE ==========
        if ($this->matchesAny($query, ['livraison', 'date', 'quand', 'délai', 'delai', 'terminé', 'termine', 'fini', 'achèvement'])) {
            $responses = [];
            foreach ($projects as $project) {
                if ($project->delivery_date) {
                    $date = \Carbon\Carbon::parse($project->delivery_date)->locale('fr')->translatedFormat('F Y');
                    $responses[] = "- **{$project->name}** : livraison prevue en **{$date}**";
                }
            }
            if (!empty($responses)) {
                return "Voici les dates de livraison prevues :\n\n" . implode("\n", $responses);
            }
            return "Les dates de livraison ne sont pas encore confirmees pour tous les projets. Contactez-nous pour plus de details.";
        }

        // ========== PRIX / VALEUR ==========
        if ($this->matchesAny($query, ['prix', 'coût', 'cout', 'valeur', 'tarif', 'combien', 'budget', 'investissement', 'cher'])) {
            $responses = [];
            foreach ($projects as $project) {
                if ($project->total_value) {
                    $value = number_format($project->total_value, 0, ',', ' ');
                    $responses[] = "- **{$project->name}** : {$value} MAD";
                }
            }
            if (!empty($responses)) {
                return "Voici les valeurs de nos projets :\n\n" . implode("\n", $responses) .
                       "\n\nPour un devis personnalise, contactez-nous au **+212 661323293**.";
            }
            return "Pour connaitre les prix detailles, veuillez nous contacter directement :\nTelephone : **+212 661323293**\nEmail : **contact@bakkah.immo**";
        }

        // ========== CONTACT ==========
        if ($this->matchesAny($query, ['contact', 'téléphone', 'telephone', 'tel', 'appeler', 'email', 'mail', 'adresse', 'où', 'ou', 'localisation', 'situé', 'situe', 'joindre', 'numéro', 'numero'])) {
            return "**Adresse** : Appt.11 Rue Goumima Res Le Louvre N 653 Etg.4, Casablanca, Maroc\n\n" .
                   "**Telephone** :\n- +212 661323293\n- +212 660533247\n\n" .
                   "**Email** : contact@bakkah.immo\n\n" .
                   "N'hesitez pas a nous ecrire ou nous appeler, notre equipe est a votre ecoute !";
        }

        // ========== À PROPOS / QUI SOMMES-NOUS ==========
        if ($this->matchesAny($query, ['qui', 'entreprise', 'société', 'societe', 'bakkah', 'histoire', 'propos', 'présentation', 'presentation', 'about'])) {
            return "**Bakkah Immobilier** est une societe immobiliere marocaine presente depuis **plus de 10 ans**.\n\n" .
                   "Nous transformons le paysage urbain marocain avec des realisations qui allient **luxe, confort et durabilite**.\n\n" .
                   "**Nos chiffres cles** :\n" .
                   "- **10+** annees d'experience\n" .
                   "- **500+** logements livres\n" .
                   "- **15** projets en cours\n" .
                   "- **98%** de clients satisfaits\n\n" .
                   "Notre vision : devenir le leader de l'immobilier premium au Maroc.";
        }

        // ========== VALEURS ==========
        if ($this->matchesAny($query, ['valeur', 'valeurs', 'qualité', 'qualite', 'innovation', 'durabilité', 'durabilite', 'mission', 'vision'])) {
            return "**Nos Valeurs Fondamentales** :\n\n" .
                   "1. **Qualite Sans Compromis** : Selection des meilleurs materiaux et artisans pour des finitions irreprochables.\n\n" .
                   "2. **Innovation** : Utilisation de technologies modernes pour un suivi de chantier transparent et efficace.\n\n" .
                   "3. **Durabilite** : Conception raisonnee pour des habitations respectueuses de l'environnement.\n\n" .
                   "**Notre Vision** : Devenir le leader de l'immobilier premium au Maroc.";
        }

        // ========== DASHBOARD / FONCTIONNALITÉS ==========
        if ($this->matchesAny($query, ['dashboard', 'tableau de bord', 'fonctionnalité', 'fonctionnalite', 'fonction', 'comment', 'utiliser', 'aide', 'help'])) {
            return "**Fonctionnalites du Tableau de Bord** :\n\n" .
                   "- Suivre l'avancement en **temps reel** de vos projets\n" .
                   "- Consulter les **etapes de construction** (termine, en cours, a venir)\n" .
                   "- Telecharger les **documents techniques** (plans PDF)\n" .
                   "- Gerer votre **profil** (nom, email, telephone)\n" .
                   "- Modifier votre **mot de passe**\n" .
                   "- Envoyer des **messages** via le formulaire de contact\n" .
                   "- **Rechercher** un projet par nom ou localisation";
        }

        // ========== CASABLANCA / VILLE ==========
        if ($this->matchesAny($query, ['casablanca', 'casa', 'rabat', 'mohammedia', 'mohammédia', 'tanger', 'marrakech', 'maroc'])) {
            $city = $query;
            $found = $projects->filter(function ($p) use ($city) {
                return str_contains(mb_strtolower($p->location ?? ''), $city) ||
                       str_contains(mb_strtolower($p->name ?? ''), $city);
            });

            if ($found->isNotEmpty()) {
                $result = "Voici nos projets dans cette zone :\n\n";
                foreach ($found as $p) {
                    $result .= "- **{$p->name}** — {$p->location} — Avancement : {$p->progress}%\n";
                }
                return $result;
            }
            return "Nous n'avons pas encore de projet dans cette zone. Contactez-nous pour en savoir plus sur nos futures operations ! Telephone : +212 661323293";
        }

        // ========== RECHERCHE DANS PROJETS (fallback) ==========
        foreach ($projects as $project) {
            $projectName = mb_strtolower($project->name);
            $words = explode(' ', $query);
            foreach ($words as $word) {
                if (mb_strlen($word) > 3 && str_contains($projectName, $word)) {
                    return $this->formatProjectDetail($project);
                }
            }
        }

        // ========== RÉPONSE PAR DÉFAUT ==========
        return "Merci pour votre message ! Je peux vous aider sur les sujets suivants :\n\n" .
               "- Tapez **\"projets\"** pour voir nos projets en cours\n" .
               "- Tapez **\"avancement\"** pour connaitre la progression\n" .
               "- Tapez **\"contact\"** pour nos coordonnees\n" .
               "- Tapez **\"bakkah\"** pour en savoir plus sur nous\n" .
               "- Tapez **\"livraison\"** pour les dates de livraison\n" .
               "- Tapez **\"aide\"** pour les fonctionnalites du dashboard\n\n" .
               "N'hesitez pas a poser votre question !";
    }

    // ====== HELPERS ======

    private function matchesAny(string $query, array $keywords): bool
    {
        foreach ($keywords as $keyword) {
            if (str_contains($query, $keyword)) {
                return true;
            }
        }
        return false;
    }

    private function fuzzyMatch(string $query, string $target): bool
    {
        $words = explode(' ', $target);
        foreach ($words as $word) {
            if (mb_strlen($word) > 3 && str_contains($query, $word)) {
                return true;
            }
        }
        return false;
    }

    private function formatProjectDetail($project): string
    {
        $result = "**{$project->name}**\n\n";
        $result .= "Localisation : **{$project->location}**\n";
        $result .= "Avancement : **{$project->progress}%**\n";
        $result .= "Statut : **{$project->status}**\n";

        if ($project->delivery_date) {
            $date = \Carbon\Carbon::parse($project->delivery_date)->locale('fr')->translatedFormat('d F Y');
            $result .= "Livraison prevue : **{$date}**\n";
        }
        if ($project->total_value) {
            $value = number_format($project->total_value, 0, ',', ' ');
            $result .= "Valeur totale : **{$value} MAD**\n";
        }

        if ($project->steps && $project->steps->isNotEmpty()) {
            $result .= "\n**Etapes de construction** :\n";
            foreach ($project->steps->sortBy('order_num') as $step) {
                $statusLabel = $step->status === 'completed' ? 'Termine' : ($step->status === 'in_progress' || $step->status === 'in-progress' ? 'En cours' : 'A venir');
                $result .= "- {$step->label} — *{$statusLabel}*\n";
            }
        }

        return $result;
    }

    private function formatProjectsList($projects): string
    {
        if ($projects->isEmpty()) {
            return "Aucun projet n'est actuellement disponible dans notre base de donnees.";
        }

        $result = "**Nos projets en cours** :\n\n";
        foreach ($projects as $project) {
            $result .= "- **{$project->name}**\n";
            $result .= "  {$project->location} — {$project->progress}%\n\n";
        }
        $result .= "Tapez le **nom d'un projet** pour plus de details !";
        return $result;
    }

    private function formatProjectProgress($project): string
    {
        $bar = $this->progressBar($project->progress);
        $result = "**Avancement de {$project->name}**\n\n";
        $result .= "{$bar} **{$project->progress}%**\n";
        $result .= "Statut : {$project->status}\n";

        if ($project->steps && $project->steps->isNotEmpty()) {
            $completed = $project->steps->where('status', 'completed')->count();
            $total = $project->steps->count();
            $result .= "Etapes terminees : **{$completed}/{$total}**";
        }
        return $result;
    }

    private function formatAllProgress($projects): string
    {
        if ($projects->isEmpty()) {
            return "Aucun projet disponible.";
        }

        $result = "**Etat d'avancement de tous les projets** :\n\n";
        foreach ($projects as $project) {
            $bar = $this->progressBar($project->progress);
            $result .= "**{$project->name}**\n{$bar} {$project->progress}%\n\n";
        }
        return $result;
    }

    private function formatProjectSteps($project): string
    {
        if (!$project->steps || $project->steps->isEmpty()) {
            return "Aucune etape enregistree pour le projet **{$project->name}**.";
        }

        $result = "**Etapes du projet {$project->name}** :\n\n";
        foreach ($project->steps->sortBy('order_num') as $step) {
            $statusLabel = $step->status === 'completed' ? 'Termine' : ($step->status === 'in_progress' || $step->status === 'in-progress' ? 'En cours' : 'A venir');
            $result .= "- **{$step->label}** — {$statusLabel}\n";
        }
        return $result;
    }

    private function progressBar(int $percent): string
    {
        $filled = (int) round($percent / 10);
        $empty = 10 - $filled;
        return '[' . str_repeat('=', $filled) . str_repeat('-', $empty) . ']';
    }
}
