package models;

public class Feedback {
    private int feedbackId;
    private int packageId;
    private int rating1;
    private int rating2;
    private int rating3;
    private String comment;

    // Constructors, getters, and setters

    public Feedback() {
    }

    public Feedback(int packageId, int rating1, int rating2, int rating3, String comment) {
        this.packageId = packageId;
        this.rating1 = rating1;
        this.rating2 = rating2;
        this.rating3 = rating3;
        this.comment = comment;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getPackageId() {
        return packageId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public int getRating1() {
        return rating1;
    }

    public void setRating1(int rating1) {
        this.rating1 = rating1;
    }

    public int getRating2() {
        return rating2;
    }

    public void setRating2(int rating2) {
        this.rating2 = rating2;
    }

    public int getRating3() {
        return rating3;
    }

    public void setRating3(int rating3) {
        this.rating3 = rating3;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
