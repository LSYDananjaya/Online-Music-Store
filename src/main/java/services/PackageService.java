package services;

import java.util.List;
import models.Package;
import dao.PackageDao;

public class PackageService {
    private PackageDao packageDao;

    public PackageService() {
        this.packageDao = new PackageDao();
    }

    public List<Package> getAllPackages() {
        return packageDao.getAllPackages();
    }

    public Package getPackageById(int id) {
        return packageDao.getPackageById(id);
    }

    public boolean addPackage(Package packageObj) {
        // You can add additional business logic/validation here before calling the DAO
        return packageDao.addPackage(packageObj);
    }

    public boolean updatePackage(Package packageObj) {
        // You can add additional business logic/validation here before calling the DAO
        return packageDao.updatePackage(packageObj);
    }

    public boolean deletePackage(int id) {
        // You can add additional business logic/validation here before calling the DAO
        return packageDao.deletePackage(id);
    }
}
