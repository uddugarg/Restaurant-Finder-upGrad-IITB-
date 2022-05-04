package com.assignment.model;

import java.util.ArrayList;

public class Restaurant {
	private String name;
	private String imageUrl;
	private String price;
	private ArrayList<String> categories;
	private float rating;
	private int reviewCount;
	private ArrayList<String> addresses;
	private String phone;
	private ArrayList<String> coordinates;
	
	public Restaurant(String name, String imageUrl, String price, ArrayList<String> categories, float rating,
			int reviewCount, ArrayList<String> addresses, String phone, ArrayList<String> coordinates) {
		super();
		this.name = name;
		this.imageUrl = imageUrl;
		this.price = price;
		this.categories = categories;
		this.rating = rating;
		this.reviewCount = reviewCount;
		this.addresses = addresses;
		this.phone = phone;
		this.coordinates = coordinates;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public ArrayList<String> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<String> categories) {
		this.categories = categories;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public ArrayList<String> getAddresses() {
		return addresses;
	}

	public void setAddresses(ArrayList<String> addresses) {
		this.addresses = addresses;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public ArrayList<String> getCoordinates() {
		return coordinates;
	}

	public void setCoordinates(ArrayList<String> coordinates) {
		this.coordinates = coordinates;
	}
}
