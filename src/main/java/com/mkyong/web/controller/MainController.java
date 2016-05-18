package com.mkyong.web.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.io.*;
import java.io.IOException;
import java.util.*;
import java.lang.Runtime;
import java.io.InputStreamReader;
import java.io.InputStream;
import java.io.BufferedReader;
import java.lang.Object;
import java.net.*;
import java.text.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import com.mkyong.users.model.Quake;
import java.io.IOException; 
import java.lang.reflect.InvocationTargetException; 
import java.lang.reflect.Method; 
import java.util.Arrays; 
import java.util.HashSet; 
import java.util.Iterator; 
import java.util.List; 
import java.util.Map; 
import java.util.Map.Entry; 
import java.util.Properties; 
import java.util.Set; 
import java.util.concurrent.TimeUnit; 
import java.util.concurrent.TimeoutException;  
import javax.annotation.PreDestroy; 
 

@Controller
public class MainController {

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Welcome!");
		model.addObject("message", "");
		model.setViewName("hello");
		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage(HttpServletRequest request) {

                String title = "Project Home";
		ModelAndView model = new ModelAndView();
		model.addObject("title", title);
		model.addObject("message", "");
		model.setViewName("admin");
		return model;

	}

	@RequestMapping(value = "/feeds", method = RequestMethod.GET)
        public ModelAndView feedsPage() {
	
		String title = "Feeds";
		ModelAndView model = new ModelAndView();
		model.addObject("title", title);
		model.setViewName("feeds");
            	return model;
        }

	@RequestMapping(value = "/feeds", method = RequestMethod.POST)
	public ModelAndView feedsPage(@RequestParam(required= false, value="feedurl") String feedurl, 
					@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (feedurl != null){

			// Formating the earthqake feeds using StringBuilder
			ArrayList<Quake> earthquakes = getQuakes(feedurl);
			System.out.println("TODAY'S EARTHQUAKES 2.5 AND HIGHER");
			SimpleDateFormat df = new SimpleDateFormat("EEE, d MMM yyyy K:mm:ss");
			StringBuilder stringBuilder = new StringBuilder();
                        
			// Build a table for displaying the feeds, loop through and parse
			stringBuilder.append("<table border=\"1\">");
			stringBuilder.append(String.format("<th><tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr></th>","WHEN", "LAT / LONG", "MAGNITUDE","DETAILS"));
			for (Quake q : earthquakes)
        		{ 
                            stringBuilder.append(String.format("<tr><td>%s</td><td>%s</td><td>%f</td><td>%s</td></tr>", df.format(q.getDate()), q.getLocation(), q.getMagnitude(), q.getDetails()));
        		}	
			stringBuilder.append("</table>");
			
			// Build the views
			String allQuakesString = stringBuilder.toString();
			model.addObject("title", "TODAY'S EARTHQUAKES MEASURING 2.5 AND HIGHER");
                        model.addObject("feedSummary", "The total number of earthquakes around the world in the last 12 hours is " + earthquakes.size());
			model.addObject("earthquakeDetails", allQuakesString);
                        model.addObject("message", "Feedurl: " + feedurl);
                        model.setViewName("feeds");
			model.addObject("feedurl", getErrorMessage(request, "This app is supposed to read RSS feeds from USGS, parse and display it in Java pges!"));
		}

		model.setViewName("feeds");
		return model;
	}

	@RequestMapping(value = "/deploy", method = RequestMethod.GET)
        public ModelAndView showDeployPage() {
	    ModelAndView model = new ModelAndView();
            model.setViewName("deploy");
            return model;
        }

	@RequestMapping(value = "/deploy", method = RequestMethod.POST)
	public ModelAndView deployPage(@RequestParam(required= false, value="hostname") String hostname, @RequestParam(required= false, value="confmanagetype") String confmanagetype, @RequestParam(required = false, value="repotype") String repotype, @RequestParam(required= false, value="citype") String citype, @RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (confmanagetype != null) {
			try {
        		Process p = Runtime.getRuntime().exec("echo confmanagetype >> test.txt");
        		BufferedReader stdInput = new BufferedReader(new 
                	InputStreamReader(p.getInputStream()));

        		BufferedReader stdError = new BufferedReader(new 
                	InputStreamReader(p.getErrorStream()));

        		// read the output from the command
        		String s="";
        
        		while ((s = stdInput.readLine()) != null) {
            		System.out.println("Std OUT: "+s);
        		}
        
        	while ((s = stdError.readLine()) != null) {
            	System.out.println("Std ERROR : "+s);
        	}
    
        
    		} catch (IOException e) {
      
        	e.printStackTrace();
    		}

		// Create the connection to the Chef server
                    // ChefService chef =
                    //        initChefService(System.getProperty("chef.client"),
                    //                System.getProperty("chef.validator"));

                    // Build the runlist for the deployed nodes
                    // System.out.println("Configuring node runlist in the Chef server...");
                    // List<String> runlist =
                    //        new RunListBuilder().addRecipes(recipes.split(",")).build();
                    // BootstrapConfig config = BootstrapConfig.builder().runList(runlist).build();
                    // chef.updateBootstrapConfigForGroup(groupName, config);
                    //Statement chefServerBootstrap = chef.createBootstrapScriptForGroup(groupName);
	
                        model.addObject("title", "You are deploying a configuration management system...");
                	model.addObject("message", "The configuration manager type chosen is " + confmanagetype);
			model.addObject("hostname", "The hostname is " + hostname);
                        model.setViewName("configuration manager deployment");
			model.addObject("chef", getErrorMessage(request, "Fail:::Installing and configuring Chef"));
		}

	 	else if (repotype != null) {
                        model.addObject("title", "You are Deploying a code Repository system");
                        model.addObject("message", "The repository type chosen is " + repotype);
                        model.setViewName("Code repository and review deployment");
			model.addObject("repo", getErrorMessage(request, "Installing and configuring Your repository and code review systems"));
		}
		
		else if (citype != null) {
                        model.addObject("title", "You are deploying a continous integration and Build System");
                        model.addObject("message", "The CI type chosen is " + citype);
                        model.setViewName("cideploy");
			model.addObject("ci", getErrorMessage(request, "Installing and configuring Your continous integration systems"));
		}
		else if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("deploy");
		return model;
	}	

	@RequestMapping(value = "/configure", method = RequestMethod.GET)
	public ModelAndView configurePage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Configure");
		model.addObject("message", "");
		model.setViewName("configure");
		return model;
        }
	@RequestMapping(value = "/administer", method = RequestMethod.GET)
	public ModelAndView administerPage() {
		//Earthquake update ends here...
				
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Administer");
		model.addObject("message", "");
		model.setViewName("administer");
		return model;
        	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");
		return model;

	}

	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Invalid username and password!";
		}

		return error;
	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is logged in
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;
	}

// This is the quakes array class used by earthquate data feeds
    public static ArrayList<Quake> getQuakes(String url) {
	ArrayList<Quake> quakes = new ArrayList<Quake>();
        try {
            URL eqcenterURL = new URL(url);
            URLConnection connection = eqcenterURL.openConnection();

            HttpURLConnection httpConnection = (HttpURLConnection) connection;
            int responseCode = httpConnection.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                InputStream in = httpConnection.getInputStream();

                // creates an XML parser
                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                DocumentBuilder db = dbf.newDocumentBuilder();

                // parse the earthquake feed xml document
                Document dom = db.parse(in);
                // the dom Document is a tree of XML elements
                Element docElement = dom.getDocumentElement();

                // get a list of sll earthquakes - each has tag "entry"
                NodeList nl = docElement.getElementsByTagName("entry");
                if (nl != null && nl.getLength() > 0) {
                    // go over each earthquake on the list
                    for (int i = 0; i < nl.getLength(); i++) {
                        // this section has a series of Document accessing methods
                        //   to get the parts of the XML document item for each earthquake
                        Element entry = (Element) nl.item(i);
                        Element title = (Element) entry.getElementsByTagName("title").item(0);
                        Element g = (Element) entry.getElementsByTagName("georss:point").item(0);
                        Element when = (Element) entry.getElementsByTagName("updated").item(0);
                        Element link = (Element) entry.getElementsByTagName("link").item(0);
                        String details = title.getFirstChild().getNodeValue();
                        String hostname = "http://earthquake.usgs.gov";
                        String linkString = hostname + link.getAttribute("href");

                        String point = g.getFirstChild().getNodeValue();
                        String dt = when.getFirstChild().getNodeValue();
                        SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss.SSS'Z'");
                        Date qdate = new GregorianCalendar(0, 0, 0).getTime();
                        qdate = sdformat.parse(dt);

                        String[] locationPair = point.split(" ");
                        String location = "Lat: " + locationPair[0] + " Lng: " + locationPair[1];

                        String magnitudeString = details.split(" ")[1];
                        double magnitude = Double.parseDouble(magnitudeString);

                        details = details.split("-")[1].trim();

                        // put all the earthquake info into a Quake structure
                        Quake quake = new Quake(qdate, details, location, magnitude, linkString);

                        //  add the quake to the ArrayList of Quakes
                        quakes.add(quake);
                    }
                }

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return quakes;
    }

}
