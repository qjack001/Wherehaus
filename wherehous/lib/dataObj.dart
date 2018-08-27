import 'dart:async';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';

class Item 
{
	String key;
	String title;
	String productNumber;
	String location;
	String position; 
	String quantity;
	String tearWeight; // tear weight
	String totalWeight; // total weight
	String lastEdit; // tracks whoever last edited an item
	bool empty;
	Future<Uri> imageUri;
	double lat;
	double long;

	Item(this.title, this.productNumber, this.location, this.position, this.quantity, this.tearWeight, this.totalWeight, this.lastEdit, this.empty, this.imageUri, this.lat, this.long);

	Item.fromSnapshot(DataSnapshot snapshot)
		: key = snapshot.key,
		title = snapshot.value["title"],
		productNumber = snapshot.value["productNumber"],
		location = snapshot.value["location"],
		position = snapshot.value["position"],
		quantity = snapshot.value["quantity"],
		tearWeight = snapshot.value["tearWeight"],
		totalWeight = snapshot.value["totalWeight"],
		lastEdit = snapshot.value["lastEdit"],
		empty = snapshot.value["empty"],
		imageUri = snapshot.value["imageUri"],
		lat = snapshot.value["lat"],
		long = snapshot.value["long"];

	toJson() 
	{
		return 
		{
		"title": title,
		"productNumber": productNumber,
		"location": location,
		"position": position,
		"quantity" : quantity,
		"tearWeight" : tearWeight,
		"totalWeight" : totalWeight,
		"lastEdit" : lastEdit,
		"empty" : empty,
		"imageUri" : imageUri,
		"lat" : lat,
		"long": long
		};
	}

	bool isEmpty()
	{
		return empty;
	}

	double getLong()
	{
		if(this.long == null)
		{
			return null;
		}

		return this.long;
	}

	double getLat()
	{
		if(this.lat == null)
		{
			return null;
		}

		return this.lat;
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

	void setImage(Future<Uri> newImage)
	{
		this.imageUri = newImage;
	}

	Future<Uri> getUri()
	{
		return this.imageUri;
	}

	void setEmpty(bool emptyIn)
	{
		empty = emptyIn;
	}

}