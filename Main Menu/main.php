<?php
    include("../connect.php");

if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL:" . mysqli_connect_error();
}
$totalusers = "SELECT Count(*) as userscount FROM students";
$usersresult = mysqli_query($con, $totalusers);
if ($usersresult) {
    $usersrow = mysqli_fetch_assoc($usersresult);
    $userCount = $usersrow['userscount'];
}
$currentMonth = date("Y-m");
$monthusers = "SELECT Count(*) as userscount FROM students where DATE_FORMAT(DateReg, '%Y-%m') = '$currentMonth'";
$monthusersresult = mysqli_query($con, $monthusers);
if ($monthusersresult) {
    $monthusersrow = mysqli_fetch_assoc($monthusersresult);
    $monthuserCount = $monthusersrow['userscount'];
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Menu</title>
    <!--css-->
    <link rel="stylesheet" href="../Main Menu/styling/main.css">
</head>

<body>
    <?php
    include("../sidepanel.php");
    ?>
    <div class="content">
        <?php
        include("../admin.php")
            ?>
        <div class="stats">
            <div class="stat-box">
                <p>This month new registered users: </p>
                <div> <?php echo $monthuserCount; ?></div>
            </div>
            <div class="stat-box">
                <p>Total registered users: </p>
                <div><?php echo $userCount; ?></div>
            </div>
        </div>
    </div>
</body>

</html>