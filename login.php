<?php

include 'includes/header.php';
include 'includes/db.php'; 

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    $stmt = $pdo->prepare('SELECT * FROM users WHERE email = ?');
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if ($user && $password === $user['password']) {
        $_SESSION['user_id'] = $user['user_id'];
        header('Location: index.php');
        exit;
    } else {
        $error = 'Invalid email or password.';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Login - MyStore</title>
  <link rel="stylesheet" href="css/c.css">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="css/style.css">
  <style>
    .form-box {
      max-width: 400px;
      margin: 50px auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .form-box h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    .form-box input {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 16px;
    }

    .form-box .btn {
      width: 100%;
      padding: 12px;
      background-color: teal;
      color: #fff;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
      margin-top: 10px;
    }

    .form-box .btn:hover {
      background-color: darkcyan;
    }

    .form-box p {
      text-align: center;
      margin-top: 15px;
    }

    .form-box a {
      color: teal;
      text-decoration: none;
    }

    .form-box a:hover {
      text-decoration: underline;
    }

    .result-box {
      margin-top: 15px;
      padding: 10px;
      border-radius: 6px;
      font-weight: bold;
      text-align: center;
    }

    .error {
      background-color: #f8d7da;
      color: #721c24;
    }
  </style>
</head>
<body>

<main class="form-box">
  <h2>Login to Your Account</h2>
  <form method="POST">
    <input type="text" name="email" placeholder="Email Address" required />
    <input type="password" name="password" placeholder="Password" required />
    <button type="submit" class="btn">Login</button>
    <p>Don't have an account? <a href="register.php">Register Here</a></p>
  </form>

  <?php if (!empty($error)): ?>
    <div class="result-box error"><?php echo $error; ?></div>
  <?php endif; ?>
</main>
<br><br><br><br>
<?php include 'includes/footer.php'; ?>
</body>
</html>
