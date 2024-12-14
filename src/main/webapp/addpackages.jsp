<!DOCTYPE html>
<html>

<head>
    <title>Add PACKAGES</title>
    <link rel="stylesheet" type="text/css" href="css/addpackageStyle.css">
</head>

<body>
    <div class="wrapper">
           <div class="wrapper">
        <div class="sidebar">
            <div class="sidebarHead">
             
                <h1>Heara</h1>
                <h3>Admin Dashboard</h3>
            </div>
            <br><br>
            <ul>
               <li><a href="/EventPlaningSystem/getPackages">All Packages</a></li>
                <li><a href="#">Add Package</a></li>
             
                <li><a href="#">Logout</a></li>
            </ul>
        </div>

        <div class="main-content">
            <div>
                <h2>Add Package details</h2>
            </div>
            <form action="createPackage" method="post">
                <div class="form-group">
                    <label>Package Name:</label>
                    <input type="text" name="packageName" required>
                </div>
                <div class="form-group">
                    <label>Type:</label>
                    <select name="type" required>
                        <option value="Action">Action</option>
                        <option value="Popular">Most Popular</option>
                        <option value="Release">New Release</option>
                        <option value="Rock">Rock</option>
                        <option value="Pop">Pop</option>
                        <option value="Acoustic">Acoustic</option>
                        <option value="Old Hits">Old Hits</option>
                        <option value="Classical">Classical</option>
                        <option value="Jazz">Jazz</option>
                        <option value="Reggae">Reggae</option>
                        <option value="Disco">Disco</option>
                        <!-- Add other types as needed -->
                    </select>
                </div>
                <div class="form-group">
                    <label>Released Year:</label>
                    <input type="text" name="releasedYear" required>
                </div>
                <div class="form-group">
                    <label>Language:</label>
                    <select name="language" required>
                        <option value="Mix">Mix</option>
                        <option value="English">English</option>
                        <option value="Sinhala">Sinhala</option>
                        <option value="Tamil">Tamil</option>
                        <option value="Spanish">Spanish</option>
                        <option value="French">French</option>
                        <option value="German">German</option>
                        <!-- Add other language options -->
                    </select>
                </div>
                <div class="form-group">
                    <label>Number of Songs:</label>
                    <input type="text" name="numberOfSongs" required>
                </div>
                <div class="form-group">
                    <label>Package Price:</label>
                    <input type="number" name="packagePrice" required>
                </div>
                <div class="form-group">
                    <label>Available Time Periods:</label>
                    <select name="availableTimePeriod" required>
                        <option value="One Month">One Month</option>
                        <option value="Three Months">Three Months</option>
                        <option value="Six Months">Six Months</option>
                        <option value="One Year">One Year</option>
                        <option value="Life Time">Life Time</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Package Poster:</label>
                    <input type="text" name="packagePoster" placeholder="image-url" required>
                </div>
                <div class="form-group">
                    <input type="submit" value="Add">
                </div>
            </form>
        </div>
    </div>
</body>

</html>
