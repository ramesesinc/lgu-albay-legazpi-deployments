package obo.facts;

import java.util.*;

public class BuildingApplication {

	String appid;
	String appno;
	Date appdate;
	String apptype;				//NEW OR RENEW
	String constructiontype;	

	String worktype;

	double projectcost;			//computed. 
	double fixedcost;  			//fixed cost
	double highercost;			//whichever is higher = computed or fixed

	int numstoreys;
	double floorarea; 			//deprecated
	double totalfloorarea; 		
	double height;
	int numunits;

	String zoneclass;
	String zone;
}


