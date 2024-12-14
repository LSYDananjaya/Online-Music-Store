package com.controllers;

import java.io.IOException;
import java.util.List;

import dao.PackageDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import services.PackageService;
import models.Package;


public class GetPackagesServlet extends HttpServlet {
    private PackageService packageService;
    private PackageDao packageDao = new PackageDao();
    public void init() {
        this.packageService = new PackageService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException {
    	String action = request.getParameter("action");
    	
        if(action==null) {
        	// Retrieve packages
            List<Package> packages = packageService.getAllPackages();

            
            request.setAttribute("packages", packages);

            // Forward to JSP page
            try {
    			request.getRequestDispatcher("/packages.jsp").forward(request, response);
    		} catch (ServletException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        }else if (action.equals("edit")){
        	System.out.println("action is " + action);
        	int id = Integer.parseInt(request.getParameter("id"));
        	Package pkg = packageService.getPackageById(id);
        	request.setAttribute("package", pkg);
        	try {
				request.getRequestDispatcher("/updatepackage.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        }else {
        	try {
				deletePackage(request,response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Post action "+action);
        if(action.equals("updatePackage")) {
        	updatePackage(request, response);
        	
        }else if(action.equals("deletePackage")) {
        	 deletePackage(request, response);
        }else {
        	System.out.println("else called");
        }
        
    }


    public void updatePackage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve all parameters from the request
            int id = Integer.parseInt(request.getParameter("id"));
            String packageName = request.getParameter("packageName");
            String type = request.getParameter("type");
            int releasedYear = Integer.parseInt(request.getParameter("releasedYear"));
            String language = request.getParameter("language");
            int numberOfSongs = Integer.parseInt(request.getParameter("numberOfSongs"));
            double packagePrice = Double.parseDouble(request.getParameter("packagePrice"));
            String availableTimePeriod = request.getParameter("availableTimePeriod");
            String packagePoster = request.getParameter("packagePoster");

            // Create a Package object with the retrieved values
            Package updatedPackage = new Package();
            updatedPackage.setId(id);
            updatedPackage.setPackageName(packageName);
            updatedPackage.setType(type);
            updatedPackage.setReleasedYear(releasedYear);
            updatedPackage.setLanguage(language);
            updatedPackage.setNumberOfSongs(numberOfSongs);
            updatedPackage.setPackagePrice(packagePrice);
            updatedPackage.setAvailableTimePeriod(availableTimePeriod);
            updatedPackage.setPackagePoster(packagePoster);

            // Call the method to update the package in the database
            packageDao.updatePackage(updatedPackage);

            // Redirect to the page showing all packages
            response.sendRedirect(request.getContextPath() + "/getPackages");
        } catch (Exception e) {
            e.printStackTrace(); // Add proper error handling based on your needs
            response.sendRedirect(request.getContextPath() + "/getPackages");
        }
    }

    private void deletePackage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
     
        packageService.deletePackage(id);


        response.sendRedirect(request.getContextPath() + "/getPackages");
    }

    public void destroy() {
        // Cleanup resources if needed
    }
}
