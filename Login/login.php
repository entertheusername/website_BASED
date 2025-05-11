<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!--css-->
    <link rel="stylesheet" href="../Login/styling/login.css">
    
</head>
<body>
    <div class="loginbox">
    <img src="../Assets/LOGO.png" width="326" height="124"></a>
    <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <p>Username</p>
        <input type="text" name="user_Name" class="textbox" value="<?php echo isset($_COOKIE['userName']) ? $_COOKIE['userName'] : ''; ?>" required> <br>
        <p>Password</p>
        <input type="password" name="user_password" class="textbox" value="<?php echo isset($_COOKIE['userPass']) ? $_COOKIE['userPass'] : ''; ?>" required> <br>
        <button type="submit" name="submit" class="loginbutt">Log in</button>
    </form>
    </div>
</body>

 <!-- login function -->
 <?php
    session_start();
    include("../connect.php");

    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $userName = mysqli_real_escape_string($con, $_POST['user_Name']);
        $userPass = mysqli_real_escape_string($con, $_POST['user_password']);

        $sql = "SELECT * FROM admins WHERE Username='$userName'";
        $result = mysqli_query($con, $sql);

        $row = mysqli_fetch_array($result);
        $rowCount = mysqli_num_rows($result);

        if ($rowCount !== 1) {
            echo '<script>alert("Username doesnt exist.");</script>';
        } else {
            if ($userPass === $row['Password']) {
                // Login successfull
                $_SESSION['mySession'] = $row['AdminID'];
                $_SESSION['name'] = $row['Username'];
                echo '<script>alert("Successfully Logged In!"); window.location.href="../Main Menu/main.php";</script>';
            } else {
                echo '<script>alert("Incorrect password.");</script>';
            }

            mysqli_close($con);
        }
    }
    ?>

</html> 
