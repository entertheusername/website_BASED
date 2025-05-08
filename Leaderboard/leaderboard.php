<?php
include("../connect.php");

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['delete_score'])) {
    $scoreIdToDelete = intval($_POST['delete_score_id']);
    $deleteQuery = "DELETE FROM scores WHERE ScoreID = $scoreIdToDelete";

    if (mysqli_query($con, $deleteQuery)) {
        echo "<script>location.reload();</script>";
    } else {
        echo "Error deleting scores: " . mysqli_error($con);
    }
    header("Location: " . $_SERVER['PHP_SELF']);
}

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['reset_score'])) {
    $modeToReset = $_POST['reset_game_mode'];
    $rangeToReset = $_POST['reset_time_range'];

    if ($rangeToReset === "Monthly") {
        // Delete only scores from the current month
        $currentMonth = date("Y-m");
        $deleteQuery = "DELETE FROM scores WHERE GameMode = '$modeToReset' AND DateSubmitted != '0000-00-00' 
                        AND DATE_FORMAT(DateSubmitted, '%Y-%m') = '$currentMonth'";
    } else {
        // Delete all scores for this game mode
        $deleteQuery = "DELETE FROM scores WHERE GameMode = '$modeToReset'";
    }

    if (mysqli_query($con, $deleteQuery)) {
        echo "<script>location.reload();</script>";
    } else {
        echo "Error resetting scores: " . mysqli_error($con);
    }

    header("Location: " . $_SERVER['PHP_SELF']);
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leaderboard</title>
    <!--css-->
    <link rel="stylesheet" href="../Leaderboard/styling/leaderboard.css">
    <!--icon-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
</head>

<body>
<?php
include("../sidepanel.php");

?>
<div class="content">
<?php
include("../admin.php");
$gameModes = ["conversion", "basic_calculation", "mixed_calculation"];
$timeRanges = ["Monthly", "All Time"];

foreach ($gameModes as $mode) {
    foreach ($timeRanges as $range) {
        echo '<div style="position: relative; width: 100%; margin-top: 10px;">';
        echo "<button class='collapsible'>" . ucfirst($mode) . " - $range</button>
            <button class='reset' onclick=\"showResetPopup('$mode', '$range')\">Reset</button>";
        echo '</div>';
        echo '<div class="leaderboardcontent">';
        echo '<table>
                <thead>
                    <tr>
                        <th>Score</th>
                        <th>Username</th>
                        <th>Time Taken</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>';
        //SQL query to get those data
        $query = "
        SELECT s.ScoreID, s.Score, s.GameMode, s.TimeTaken, s.DateSubmitted, st.Username
        FROM scores s
        INNER JOIN students st ON s.StudentID = st.StudentID
        INNER JOIN (SELECT StudentID, MAX(Score) AS MaxScore
        FROM scores WHERE GameMode = ?
        ";
            
        if ($range == "Monthly") {
            $query .= " AND DateSubmitted != '0000-00-00' AND DATE_FORMAT(DateSubmitted, '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m')";
        }

        $query .= "GROUP BY StudentID) t 
        ON s.StudentID = t.StudentID AND s.Score = t.MaxScore
        WHERE s.GameMode = ?
        ";
            
        if ($range == "Monthly") {
            $query .= " AND s.DateSubmitted != '0000-00-00' AND DATE_FORMAT(s.DateSubmitted, '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m')";
        }
            
        $query .= "ORDER BY s.Score DESC, s.DateSubmitted DESC, s.ScoreID DESC";
        //execute the query    
        $stmt = $con->prepare($query);
        $stmt->bind_param('ss', $mode, $mode); 
        $stmt->execute();
        $result = $stmt->get_result();
        //sort the query to make sure that there is only one usename in leaderboard
        $finalResult = [];
        $studentSeen = [];
        while ($row = $result->fetch_assoc()) {
            if (!in_array($row['Username'], $studentSeen)) {
                $studentSeen[] = $row['Username'];
                $finalResult[] = $row;
            }
        }
        //sort again according to the socre (just incase it dosent)
        usort($finalResult, function($a, $b) {
            return $b['Score'] - $a['Score'];
        });

        foreach ($finalResult as $row) {
            echo "<tr>
                    <td>{$row['Score']}</td>
                    <td>{$row['Username']}</td>
                    <td>{$row['TimeTaken']}</td>
                    <td>
                    <a href='javascript:void(0)' class='deletebutton' onclick='showDeleteScorePopup({$row['ScoreID']})'>
                        <span class='material-icons-outlined' id='deleteicon'>delete</span>
                    </a>
                  </td>
                  </tr>";
        }

        echo '</tbody></table></div>';
    }
}
?>
</div>

</body>

</html>
<div id="popupdelete" class="general-popup" style="display: none;">
    <div class="general-popup-content">
        <form method="POST">
            <input type="hidden" name="delete_score_id" id="delete_score_id" value="">
            <p style="margin-left: 20%;">Are you sure you want to delete this score?</p>
            <button type="submit" name="delete_score">Yes</button>
            <button type="button" onclick="closePopup('popupdelete')">No</button>
        </form>
    </div>
</div>

<!-- JS functions -->
<script>
    function showDeleteScorePopup(scoreId) {
        document.getElementById("delete_score_id").value = scoreId;
        document.getElementById("popupdelete").style.display = "block";
    }

    function closePopup(popupId) {
        document.getElementById(popupId).style.display = "none";
    }
</script>

<!-- Popup Reset -->
<div id="popupReset" class="general-popup" style="display: none;">
    <div class="general-popup-content">
        <form method="POST">
            <input type="hidden" name="reset_game_mode" id="reset_game_mode" value="">
            <input type="hidden" name="reset_time_range" id="reset_time_range" value="">
            <p style="margin-left: 20%;">Are you sure you want to reset all scores for this category?</p>
            <button type="submit" name="reset_score">Yes</button>
            <button type="button" onclick="closePopup('popupReset')">No</button>
        </form>
    </div>
</div>

<script>
    function showResetPopup(gameMode, timeRange) {
        document.getElementById("reset_game_mode").value = gameMode;
        document.getElementById("reset_time_range").value = timeRange;
        document.getElementById("popupReset").style.display = "block";
    }

    function closePopup(popupId) {
        document.getElementById(popupId).style.display = "none";
    }
</script>
