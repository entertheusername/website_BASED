<?php
include("../connect.php");

// Handle Ban/Unban toggle request
if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['toggle_ban'])) {
    $studentId = intval($_POST['toggle_student_id']);
    $currentStatus = intval($_POST['current_ban_status']);
    $newStatus = $currentStatus === 1 ? 0 : 1;

    $banQuery = "UPDATE students SET BanStatus = $newStatus WHERE StudentID = $studentId";

    if (mysqli_query($con, $banQuery)) {
        header("Location: " . $_SERVER['PHP_SELF']);
        exit();
    } else {
        echo "Error updating student status: " . mysqli_error($con);
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <!--css-->
    <link rel="stylesheet" href="../User Management/styling/usermanagement.css">
    <!--icon-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
</head>

<body>
    <?php include("../sidepanel.php"); ?>
    <div class="content">
        <div class="headercontainer">
            <?php include("../admin.php"); ?>
            <div class="searchbar">
                <span class="material-icons-outlined" id="searchlogo">search</span>
                <input type="text" id="search" class="search" placeholder="Search username" style="color:#7373F5;" size="20">
            </div>
        </div>

        <div class="container">
            <table>
                <thead>
                    <tr>
                        <th>Date Reg</th>
                        <th>Username</th>
                        <th>High Score</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="userTable">
                    <?php
                    $query = "
                        SELECT 
                            s.StudentID, 
                            s.Username, 
                            s.DateReg,
                            s.BanStatus,
                            MAX(CASE WHEN sc.GameMode = 'conversion' THEN sc.Score ELSE NULL END) AS ConversionScore,
                            MAX(CASE WHEN sc.GameMode = 'basic_calculation' THEN sc.Score ELSE NULL END) AS BasicScore,
                            MAX(CASE WHEN sc.GameMode = 'mixed_calculation' THEN sc.Score ELSE NULL END) AS MixedScore
                        FROM students s
                        LEFT JOIN scores sc ON s.StudentID = sc.StudentID
                        GROUP BY s.StudentID, s.Username, s.DateReg, s.BanStatus
                    ";

                    $result = mysqli_query($con, $query);

                    if (mysqli_num_rows($result) > 0) {
                        while ($row = mysqli_fetch_assoc($result)) {
                            $dateReg = date("d/m/Y", strtotime($row['DateReg']));
                            $username = $row['Username'];
                            $studentID = $row['StudentID'];
                            $conversion = $row['ConversionScore'] ?? '-';
                            $basic = $row['BasicScore'] ?? '-';
                            $mixed = $row['MixedScore'] ?? '-';
                            $banStatus = $row['BanStatus'];
                            $actionText = $banStatus == 1 ? 'Unban' : 'Ban';

                            echo '
                            <tr>
                                <td>' . $dateReg . '</td>
                                <td>' . $username . '</td>
                                <td>
                                    <div class="score-container">
                                        <div class="Category">' . $conversion . '<span class="Cat">Conversion</span></div>
                                        |
                                        <div class="Category">' . $basic . '<span class="Cat">Basic Calculation</span></div>
                                        |
                                        <div class="Category">' . $mixed . '<span class="Cat">Mixed Calculation</span></div>
                                    </div>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" class="ban-button" onclick="showBanPopup(' . $studentID . ', ' . $banStatus . ')">' . $actionText . '</a>
                                </td>
                            </tr>';
                        }
                    } else {
                        echo '<tr><td colspan="6">No student data found.</td></tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Ban/Unban Popup -->
    <div id="popupBan" class="general-popup">
        <div class="general-popup-content">
            <form method="POST">
                <input type="hidden" name="toggle_student_id" id="toggle_student_id" value="">
                <input type="hidden" name="current_ban_status" id="current_ban_status" value="">
                <p id="banMessage" style="margin-left: 20%;"></p>
                <button type="submit" name="toggle_ban">Yes</button>
                <button type="button" onclick="closePopup('popupBan')">No</button>
            </form>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        function showBanPopup(studentId, banStatus) {
            document.getElementById("toggle_student_id").value = studentId;
            document.getElementById("current_ban_status").value = banStatus;

            const message = banStatus == 1 ?
                "Are you sure you want to unban this account?" :
                "Are you sure you want to ban this account?";

            document.getElementById("banMessage").textContent = message;
            document.getElementById("popupBan").style.display = "block";
        }

        function closePopup(popupId) {
            document.getElementById(popupId).style.display = "none";
        }

        document.getElementById("search").addEventListener("keyup", function () {
            const keyword = this.value.toLowerCase();
            const rows = document.querySelectorAll("#userTable tr");

            rows.forEach(row => {
                const username = row.querySelector("td:nth-child(2)").textContent.toLowerCase();
                row.style.display = username.includes(keyword) ? "" : "none";
            });
        });
    </script>
</body>

</html>
