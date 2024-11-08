<?php
// Token de acceso generado en Meta for Developers
$token = 'EAAV9LHucZBrABOxXJa69wgOg1f1QOLttYzu8tCJVyz4WtlrGnTMR7bsdJaV3EZCmQNs1u6VMDiIZCdGjmmkz8SfLvPiJxa7xZBaD1nqKF5AZAEQItf5IElGgPxK6ZCmXwAENFmNKZB3jVWWvWnHtnxrZC6SWvSCjIndlhX16nfmysoZAOgMLF2lMWOFFttl7bXNNyZAwZAPphPQXkmzRJem3BhyJ4cKEZBCRuDikjRIZD';
$from_number = '485865064604958'; // Ejemplo: 1234567890
$to_number = '+50494856463'; // Número de WhatsApp de destino, incluyendo el código de país (ejemplo: 52 para México)

// Datos del mensaje
$data = [
    'messaging_product' => 'whatsapp',
    'to' => $to_number,
    'type' => 'text',
    'text' => [
        'body' => '¡Hola! Este es un mensaje de prueba desde PHP usando WhatsApp Cloud API.'
    ]
];

// Configurar y enviar la solicitud
$url = 'https://graph.facebook.com/v21.0/' . $from_number . '/messages';
$options = [
    'http' => [
        'header' => "Authorization: Bearer $token\r\n" .
                    "Content-Type: application/json\r\n",
        'method' => 'POST',
        'content' => json_encode($data),
    ]
];
$context = stream_context_create($options);
$result = file_get_contents($url, false, $context);

if ($result === FALSE) {
    echo "Error al enviar el mensaje.";
} else {
    echo "Mensaje enviado con éxito: " . $result;
}
?>
