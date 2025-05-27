<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $to = "m6377116@gmail.com"; 
    $subject = "Tech Corner Feedback";

    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $message = htmlspecialchars($_POST['message']);

    $headers = "From: $name <$email>\r\n";
    $headers .= "Reply-To: $email\r\n";

    $body = "Name: $name\nEmail: $email\n\nMessage:\n$message";

    if (mail($to, $subject, $body, $headers)) {
        echo "Thank you for your feedback!";
    } else {
        echo "Sorry, your message could not be sent.";
    }
} else {
    header("Location: about.php");
    exit();
}
