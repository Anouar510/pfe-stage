<!DOCTYPE html>
<html>
<head>
    <title>Rapport des Projets - Bakkah Immobilier</title>
    <style>
        body { font-family: sans-serif; font-size: 12px; }
        .header { text-align: center; margin-bottom: 20px; }
        .header h1 { margin: 0; color: #4f46e5; }
        .header p { color: #64748b; margin-top: 5px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        thead th { background-color: #f1f5f9; text-align: left; padding: 10px; border-bottom: 2px solid #e2e8f0; color: #475569; }
        tbody td { padding: 8px 10px; border-bottom: 1px solid #e2e8f0; color: #1e293b; }
        .status-badge { padding: 4px 8px; border-radius: 12px; font-weight: bold; font-size: 10px; }
        .status-completed { color: #15803d; background-color: #dcfce7; }
        .status-pending { color: #a16207; background-color: #fef9c3; }
        .footer { position: fixed; bottom: 0; width: 100%; text-align: center; font-size: 10px; color: #94a3b8; border-top: 1px solid #e2e8f0; padding-top: 10px; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Bakkah Immobilier</h1>
        <p>Rapport des Projets - {{ date('d/m/Y') }}</p>
    </div>

    <table>
        <thead>
            <tr>
                <th>Projet</th>
                <th>Client</th>
                <th>Localisation</th>
                <th>Avancement</th>
                <th>Valeur (Dh)</th>
                <th>Livraison</th>
                <th>Statut</th>
            </tr>
        </thead>
        <tbody>
            @foreach($projects as $project)
            <tr>
                <td><strong>{{ $project->name }}</strong></td>
                <td>{{ $project->user ? $project->user->name : 'N/A' }}</td>
                <td>{{ $project->location }}</td>
                <td>
                    {{ $project->progress }}%
                    <div style="width: 50px; height: 4px; background: #e2e8f0; display: inline-block; vertical-align: middle; margin-left: 5px;">
                        <div style="width: {{ $project->progress }}%; height: 100%; background: #4f46e5;"></div>
                    </div>
                </td>
                <td>{{ number_format($project->total_value, 0, ',', ' ') }}</td>
                <td>{{ $project->delivery_date }}</td>
                <td>
                    <span class="status-badge {{ $project->progress == 100 ? 'status-completed' : 'status-pending' }}">
                        {{ $project->status }}
                    </span>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <div class="footer">
        &copy; {{ date('Y') }} Bakkah Immobilier - Document généré automatiquement.
    </div>
</body>
</html>
