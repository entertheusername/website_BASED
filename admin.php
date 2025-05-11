<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
    <!--symbol-->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=account_circle" />


</head>

<body>
    <?php include("../session.php"); 
    ?>
    <div class="adminacc">
        <span class="material-symbols-outlined" id="logo">
            account_circle
        </span>
        <?php
        echo "<span>Admin ID: {$_SESSION['name']} </span>";
        ?>
    </div>
</body>

</html>
