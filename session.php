<?php
session_start();
if (!isset($_SESSION['mySession'])) {
    // Redirect to login page if session is not set
    echo "<script>alert('Please login!');window.location.href='../Login/login.php';</script>";
    exit();
} 
?>