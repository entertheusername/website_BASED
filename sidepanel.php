<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidepanel</title>
    <!--css link-->
    <link rel="stylesheet" href="../style.css">
    <!--font-->
    <link href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap" rel="stylesheet">
    <!--js-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../main.js"></script>
    
</head>

<body>

    <div class="sidebar">
        <a class="logo" href="../Main Menu/main.php"><img src="../Assets/LOGO.png" width="326" height="124" onclick="localStorage.removeItem('selectedItem');"></a>
        <ul class="menu">
            <li><a class="sidepanelitem" href="../Leaderboard/leaderboard.php">Leaderboard</a></li>
            <li><a class="sidepanelitem" href="../User Management/usermanagement.php">User Management</a></li>
        </ul>
        <a href="javascript:void(0)" class="logout" id="buttonpopup" onclick="showPopup('popuplogout')">Log Out</a>
    </div>

</body>

</html>
<!--popup window logout-->
<div id="popuplogout" class="general-popup">
    <div class="general-popup-content">
        <p>Are you sure you want to logout?!</p>
        <button onclick="window.location.href='../logout.php';">Yes</button>
        <button id="closePopup" onclick="closePopup('popuplogout')">No</button>
    </div>
</div>
