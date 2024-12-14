package com.controllers;

import java.io.IOException;

import jakarta.servlet.http.*;
import models.Package;
import services.PackageService;


public class CreatePackageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PackageService packageService = new PackageService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Retrieve form parameters
        String packageName = request.getParameter("packageName");
        String type = request.getParameter("type");
        int releasedYear = Integer.parseInt(request.getParameter("releasedYear"));
        String language = request.getParameter("language");
        int numberOfSongs = Integer.parseInt(request.getParameter("numberOfSongs"));
        double packagePrice = Double.parseDouble(request.getParameter("packagePrice"));
        String availableTimePeriod = request.getParameter("availableTimePeriod");
        String packagePoster = request.getParameter("packagePoster");

        // Create a Package object
        Package newPackage = new Package();
        newPackage.setPackageName(packageName);
        newPackage.setType(type);
        newPackage.setReleasedYear(releasedYear);
        newPackage.setLanguage(language);
        newPackage.setNumberOfSongs(numberOfSongs);
        newPackage.setPackagePrice(packagePrice);
        newPackage.setAvailableTimePeriod(availableTimePeriod);
        newPackage.setPackagePoster(packagePoster);
        
        packageService.addPackage(newPackage);
     
        response.sendRedirect("/EventPlaningSystem/getPackages");
    }
}
