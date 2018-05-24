import 'dart:async';
import 'dart:io';
import 'package:geolocation/geolocation.dart';
class Item 
{
	String title;
	String productNumber;
	String location;
	String position; 
	String quantity;
	String tearWeight; // tear weight
	String totalWeight; // total weight
	String lastEdit; // tracks whoever last edited an item
	bool empty;
  Future<File> image;
  LocationResult gps;

	Item(String name, String numb, String loc, String spot, String quan, String tear, String tot, String edit, bool emptIn, Future<File> newImage, LocationResult newGps)
	{
		title = name;
		productNumber = numb;
		location = loc;
		position = spot;
		quantity = quan;
		tearWeight = tear;
		totalWeight= tot;
		lastEdit = edit;
		empty = emptIn;
    image = newImage;
    gps = newGps;
	}

	bool isEmpty()
	{
		return empty;
	}
  
  LocationResult getGps()
  {
    return gps;
  }
  void setGps(newGps)
  {
    this.gps = newGps;
  }

	String getInfo(int id)
	{
		switch (id)
		{
			case 0:
				return this.title;
			case 1:
				return this.productNumber;
			case 2:
				return this.location;
			case 3:
				return this.position;
			case 4:
				return this.quantity;
			case 5:
				return this.tearWeight;
			case 6:
				return this.totalWeight;
			case 7:
				return this.lastEdit;
		}

		return 'Invalid id';
	}

	void editInfo(int id, String data)
	{
		switch (id)
		{
			case 0:
				this.title = data;
				break;
			case 1:
				this.productNumber = data;
				break;
			case 2:
				this.location = data;
				break;
			case 3:
				this.position = data;
				break;
			case 4:
				this.quantity = data;
				break;
			case 5:
				this.tearWeight = data;
				break;
			case 6:
				this.totalWeight = data;
				break;
			case 7:
				this.lastEdit = data;
				break;
		}
	}

  void setImage(Future<File> newImage)
  {
    this.image = newImage;
  }

  Future<File> getImage()
  {
    return this.image;
  }
  
	void setEmpty(bool emptyIn)
	{
		empty = emptyIn;
	}

}