<!DOCTYPE html>
<html>
<head>
    <title>Nouveau message de contact</title>
</head>
<body>
    <h2>Nouveau message depuis le formulaire de contact</h2>
    <p><strong>Utilisateur :</strong> {{ $user->name }} ({{ $user->email }})</p>
    <p><strong>Sujet :</strong> {{ $subject }}</p>
    <p><strong>Message :</strong></p>
    <p>{{ $content }}</p>
</body>
</html>
