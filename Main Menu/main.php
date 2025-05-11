<?php
    include("../connect.php"); 
if (mysqli_connect_errno()) { 
    echo "Failed to connect to MySQL:" . mysqli_connect_error(); 
} 

// Count total registered users
$totalusers = "SELECT Count(*) as userscount FROM students"; 
$usersresult = mysqli_query($con, $totalusers); 
if ($usersresult) { 
    $usersrow = mysqli_fetch_assoc($usersresult); 
    $userCount = $usersrow['userscount']; 
} 

// Count total registered users in the current month
$currentMonth = date("Y-m"); 
$monthusers = "SELECT Count(*) as userscount FROM students where DATE_FORMAT(DateReg, '%Y-%m') = '$currentMonth'"; 
$monthusersresult = mysqli_query($con, $monthusers); 
if ($monthusersresult) { 
    $monthusersrow = mysqli_fetch_assoc($monthusersresult); 
    $monthuserCount = $monthusersrow['userscount']; 
} 

// Count active users in the current month
$monthActiveUsers = "SELECT COUNT(DISTINCT s.StudentID) as activecount 
                    FROM students s 
                    JOIN scores sc ON s.StudentID = sc.StudentID 
                    WHERE DATE_FORMAT(sc.DateSubmitted, '%Y-%m') = '$currentMonth'";
$monthActiveResult = mysqli_query($con, $monthActiveUsers);
if ($monthActiveResult) {
    $monthActiveRow = mysqli_fetch_assoc($monthActiveResult);
    $monthActiveCount = $monthActiveRow['activecount'];
} else {
    $monthActiveCount = 0;
}

// Count users who completed the tutorial
$tutorialUsers = "SELECT COUNT(*) as tutorialcount FROM students WHERE TutorialStat = 1";
$tutorialResult = mysqli_query($con, $tutorialUsers);
if ($tutorialResult) {
    $tutorialRow = mysqli_fetch_assoc($tutorialResult);
    $tutorialCount = $tutorialRow['tutorialcount'];
} else {
    $tutorialCount = 0;
}
?> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Menu</title>
    <!--CSS-->
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
                <p>Total registered users: </p>
                <div> <?php echo $userCount; ?></div>
            </div>
            <div class="stat-box">
                <p>This month registered users: </p>
                <div><?php echo $monthuserCount; ?></div>
            </div>
            <div class="stat-box">
                <p>This month active users: </p>
                <div><?php echo $monthActiveCount; ?></div>
            </div>
            <div class="stat-box">
                <p>Total users that completed tutorial: </p>
                <div><?php echo $tutorialCount; ?></div>
            </div>
        </div>
    </div>
</body>

</html>
