package models;

public class Package {
private int packageId;
    public String packageName;
    public String type;
    public int releasedYear;
    public String language;
    public int numberOfSongs;
    public double packagePrice;
    public String availableTimePeriod;
    public String packagePoster;

    public int getPackageId() {
    	return this.packageId;
    }
    
    public void setId(int id) {
    	this.packageId = id;
    }

    // Getters
    public String getPackageName() {
        return packageName;
    }

    public String getType() {
        return type;
    }

    public int getReleasedYear() {
        return releasedYear;
    }

    public String getLanguage() {
        return language;
    }

    public int getNumberOfSongs() {
        return numberOfSongs;
    }

    public double getPackagePrice() {
        return packagePrice;
    }

    public String getAvailableTimePeriod() {
        return availableTimePeriod;
    }

    public String getPackagePoster() {
        return packagePoster;
    }

    // Setters
    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setReleasedYear(int releasedYear) {
        this.releasedYear = releasedYear;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public void setNumberOfSongs(int numberOfSongs) {
        this.numberOfSongs = numberOfSongs;
    }

    public void setPackagePrice(double packagePrice) {
        this.packagePrice = packagePrice;
    }

    public void setAvailableTimePeriod(String availableTimePeriod) {
        this.availableTimePeriod = availableTimePeriod;
    }

    public void setPackagePoster(String packagePoster) {
        this.packagePoster = packagePoster;
    }
}
