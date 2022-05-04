package com.assignment.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.assignment.model.Restaurant;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import static com.mongodb.client.model.Filters.eq;


public class MainService {
	
	//for logging parameters which are passed to server
	private static final Logger logger = LoggerFactory.getLogger(MainService.class);
	
	public MainService(String category, String location){
		logger.info("Searched parameters: Find " + category + " near " + location);
	}
	
	public ArrayList<Restaurant> getNearRestaurants(String category, String location) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = getHeaders();
		HttpEntity<String> entity;
		ResponseEntity<String> response;
		String url = "";
		String json = "";		
		
		//set params to ArrayList
		ArrayList<String> params = new ArrayList<String>();
		params.add(category);
		params.add(location);
		
		//Attributes of Connection to MongoDB
		/*
		 * dbuser = db123
		 * dbpassword = db123
		 * database = restaurant-finder
		 */
		String mongoUri = "mongodb://db123:db123@ds163918.mlab.com:63918/restaurant-finder";
		MongoClientURI uri = new MongoClientURI(mongoUri);
		MongoClient mc = new MongoClient(uri);
		MongoDatabase mdb = mc.getDatabase("restaurant-finder");
		
		//try to get data in cache (Mongo DB)
		org.bson.Document result = mdb.getCollection("restaurants").find(eq("params", params)).first();
		
		//if there's at least one data with the passed attributes
		if(result != null) {
			//use cache data from MongoDB with the passed attributes
			json = result.getString("content");
		
		//if there's no data with the passed attributes
		}else {
			//request to Yelp API
			//if the category is empty fill in the home/result page, then just the location as parameter that be sent
			if(category.equals("all"))
				url = "https://api.yelp.com/v3/businesses/search?location="+ location;
			else
				url = "https://api.yelp.com/v3/businesses/search?location="+ location + "&categories=" + category;
			
			entity = new HttpEntity<String>(headers);
			response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
			json = response.getBody();
			
			//add cache to MongoDB
			org.bson.Document doc = new org.bson.Document();
			doc.append("params", params);
			doc.append("content", json);
			mdb.getCollection("restaurants").insertOne(doc);	
		}
		
		JSONArray businessesJSON = null;
		try {
			businessesJSON = (new JSONObject(json)).getJSONArray("businesses");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ArrayList<Restaurant> restaurants = new ArrayList<Restaurant>();
		Restaurant tempAdd = null;
		String name, imageUrl, price, phone;
		ArrayList<String> categories , addresses , coordinates;
		float rating = 0;
		int reviewCount = 0;
		
		//add each object of JSON to List of Restaurant
		for(int i = 0; i < businessesJSON.length(); i++) {
			try {
				//initialization when loop
				name = imageUrl = price = phone = "";
				categories = new ArrayList<String>();
				addresses = new ArrayList<String>();
				coordinates = new ArrayList<String>();
				rating = reviewCount = 0;
				
				//get JSON data
				name = businessesJSON.getJSONObject(i).getString("name");
				imageUrl = businessesJSON.getJSONObject(i).getString("image_url");
				
				if(businessesJSON.getJSONObject(i).has("price"))
					price = businessesJSON.getJSONObject(i).getString("price");
				
				JSONArray ctgs = businessesJSON.getJSONObject(i).getJSONArray("categories");
				
				//get JSON data from Categories
				if(ctgs.length() > 0) {
					for(int ctg = 0; ctg < ctgs.length(); ctg++) {
						categories.add(ctgs.getJSONObject(ctg).getString("title"));
					}
				}
				
				rating = (float) businessesJSON.getJSONObject(i).getDouble("rating");
				reviewCount = businessesJSON.getJSONObject(i).getInt("review_count");
				
				//get JSON data from Address
				JSONArray addrs = businessesJSON.getJSONObject(i).getJSONObject("location").getJSONArray("display_address");
				for(int addr = 0; addr < addrs.length(); addr++) {
					addresses.add(addrs.getString(addr));
				}
				
				phone = businessesJSON.getJSONObject(i).getString("display_phone");
				
				//get JSON data from Coordinates
				JSONObject coords = businessesJSON.getJSONObject(i).getJSONObject("coordinates");
				coordinates.add(coords.getString("latitude"));
				coordinates.add(coords.getString("longitude"));

				//create Restaurant object and add it to List of Restaurants
				tempAdd = new Restaurant(name, imageUrl, price, categories, rating, reviewCount, addresses, phone, coordinates);
				restaurants.add(tempAdd);
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
				
		return restaurants;
	}
	
	public HttpHeaders getHeaders() {
		String encodedApiKey = "c4WBQQDhYb2kHjZaJRaJL097b98fRgAPaLlP5YV8XWad71vK5mxvhWzetp817K5cRR1l_Xzhx1aw1GZW0crfUww7myiqThsACuNADmkdSjTih3KvQ9hSyKNzgpCiWnYx";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + encodedApiKey);
		headers.setContentType(MediaType.APPLICATION_JSON);
		return headers;
	}
}
