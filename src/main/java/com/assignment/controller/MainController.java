package com.assignment.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.model.Restaurant;
import com.assignment.service.MainService;

@Controller
public class MainController {
	
	private MainService mainService;
	
	//redirect to Home Page
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	//redirect to Result Page
	@RequestMapping(method = RequestMethod.POST, value = "/result", produces = "application/json")
	public String getNearRestaurants(@RequestParam("category") String category, @RequestParam("location") String location, Model model) {
		/*
		 * this make default location for the empty location --> Las Vegas (inspired from Yelp by using current location)
		 * */
		if(category.equals(""))
			category = "all";
		if(location.equals(""))
			location = "Las Vegas";
		
		//access to get ArrayList of restaurants data
		mainService = new MainService(category, location);
		ArrayList<Restaurant> restaurants = mainService.getNearRestaurants(category, location);
		
		//set attribute to be passed into JSP
		model.addAttribute("category", category);
		model.addAttribute("location", location);
		model.addAttribute("restaurants", restaurants);
		return "result";
	}
	
}
