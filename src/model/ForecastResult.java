package model;

public class ForecastResult {
    private String beerName;
    private String weekday;
    private double prediction;
 
    // Getters & Setters
    public String getBeerName() { return beerName; }
    public void setBeerName(String beerName) { this.beerName = beerName; }
 
    public String getWeekday() { return weekday; }
    public void setWeekday(String weekday) { this.weekday = weekday; }
 
    public double getPrediction() { return prediction; }
    public void setPrediction(double prediction) { this.prediction = prediction; }
}