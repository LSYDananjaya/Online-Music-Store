package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.Package;
public class PackageDao {
    private Connection connection;

    public PackageDao() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/music_store", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Package> getAllPackages() {
        List<Package> packages = new ArrayList<>();
        String query = "SELECT * FROM packages";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Package packageObj = new Package();
                packageObj.setId(resultSet.getInt("id"));
                packageObj.setPackageName(resultSet.getString("packageName"));
                packageObj.setType(resultSet.getString("type"));
                packageObj.setReleasedYear(resultSet.getInt("releasedYear"));
                packageObj.setLanguage(resultSet.getString("language"));
                packageObj.setNumberOfSongs(resultSet.getInt("numberOfSongs"));
                packageObj.setPackagePrice(resultSet.getDouble("packagePrice"));
                packageObj.setAvailableTimePeriod(resultSet.getString("availableTimePeriod"));
                packageObj.setPackagePoster(resultSet.getString("packagePoster"));

                packages.add(packageObj);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return packages;
    }

    public Package getPackageById(int id) {
        String query = "SELECT * FROM packages WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Package packageObj = new Package();
                packageObj.setId(resultSet.getInt("id"));
                packageObj.setPackageName(resultSet.getString("packageName"));
                packageObj.setType(resultSet.getString("type"));
                packageObj.setReleasedYear(resultSet.getInt("releasedYear"));
                packageObj.setLanguage(resultSet.getString("language"));
                packageObj.setNumberOfSongs(resultSet.getInt("numberOfSongs"));
                packageObj.setPackagePrice(resultSet.getDouble("packagePrice"));
                packageObj.setAvailableTimePeriod(resultSet.getString("availableTimePeriod"));
                packageObj.setPackagePoster(resultSet.getString("packagePoster"));

                return packageObj;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addPackage(Package packageObj) {
        String query = "INSERT INTO packages (packageName, type, releasedYear, language, numberOfSongs, packagePrice, availableTimePeriod, packagePoster) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, packageObj.getPackageName());
            preparedStatement.setString(2, packageObj.getType());
            preparedStatement.setInt(3, packageObj.getReleasedYear());
            preparedStatement.setString(4, packageObj.getLanguage());
            preparedStatement.setInt(5, packageObj.getNumberOfSongs());
            preparedStatement.setDouble(6, packageObj.getPackagePrice());
            preparedStatement.setString(7, packageObj.getAvailableTimePeriod());
            preparedStatement.setString(8, packageObj.getPackagePoster());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePackage(Package packageObj) {
        String query = "UPDATE packages SET packageName = ?, type = ?, releasedYear = ?, language = ?, numberOfSongs = ?, packagePrice = ?, availableTimePeriod = ?, packagePoster = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, packageObj.getPackageName());
            preparedStatement.setString(2, packageObj.getType());
            preparedStatement.setInt(3, packageObj.getReleasedYear());
            preparedStatement.setString(4, packageObj.getLanguage());
            preparedStatement.setInt(5, packageObj.getNumberOfSongs());
            preparedStatement.setDouble(6, packageObj.getPackagePrice());
            preparedStatement.setString(7, packageObj.getAvailableTimePeriod());
            preparedStatement.setString(8, packageObj.getPackagePoster());
            // Assuming 'id' is the primary key
            preparedStatement.setInt(9, packageObj.getPackageId());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePackage(int id) {
        String query = "DELETE FROM packages WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
