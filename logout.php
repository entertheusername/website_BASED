<?php
session_start();
session_destroy();
echo '<script>localStorage.removeItem("selectedItem");alert("Successfully Logged Out!"); window.location.href="../BASED/Login/login.php";</script>';
?>
