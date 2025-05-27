<?php
include 'includes/header.php';
redirectIfNotLoggedIn();

if(isset($_GET['product_id'])) {
    $product_id = $_GET['product_id'];
    
    
    $stmt = $pdo->prepare('SELECT * FROM cart WHERE user_id=? AND product_id=?');
    $stmt->execute([$_SESSION['user_id'], $product_id]);
    
    if($stmt->rowCount() > 0) {
        
        $pdo->prepare('UPDATE cart SET quantity=quantity+1 WHERE user_id=? AND product_id=?')
            ->execute([$_SESSION['user_id'], $product_id]);
    } else {
        
        $pdo->prepare('INSERT INTO cart (user_id, product_id, quantity) VALUES (?,?,1)')
            ->execute([$_SESSION['user_id'], $product_id]);
    }
    
    header('Location: cart.php');
    exit;
}

header('Location: index.php');
exit;
?>