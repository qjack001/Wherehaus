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
	String imageUrl;
	double lat;
	double long;
	String pONumber; //required // 8
	String processing; // dropdown: Raw Material, Cut, Weld, Painted, Galvanized, Assembled, Finished //9
	String customer; // not required //10
	String salesNumber; // Sales Order Number //11
	String partNumber; //12
	String created; // record name of object instancer //13

	Item(this.title, this.productNumber, this.location, this.position, this.quantity, this.tearWeight, this.totalWeight, this.lastEdit, this.empty, this.imageUrl, this.lat, this.long,
  this.pONumber, this.processing, this.customer, this.salesNumber, this.partNumber,this.created);

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
		imageUrl = snapshot.value["imageUrl"],
		lat = snapshot.value["lat"],
		long = snapshot.value["long"],
		pONumber = snapshot.value["pONumber"],
		processing = snapshot.value["processing"],
		customer = snapshot.value["customer"],
		salesNumber = snapshot.value["salesNumber"],
		partNumber = snapshot.value["partNumber"],
		created = snapshot.value["created"];


	
	toJson() 
	{
		return 
		{
			"title": title, //0
			"productNumber": productNumber, //1
			"location": location, //2
			"position": position, //3
			"quantity" : quantity, //4
			"tearWeight" : tearWeight, //5
			"totalWeight" : totalWeight, //6
			"lastEdit" : lastEdit, //7
			"empty" : empty,
			"imageUrl" : imageUrl,
			"lat" : lat,
			"long": long,
			"pONumber": pONumber, //8
			"processing" : processing, //9
			"customer" : customer, //10
			"salesNumber" : salesNumber, //11
			"partNumber" : partNumber, //12
			"created" : created //13
		};
	}

  //later additions
  //getter and setter for PO#
  String getPONumber()
  {
    return this.pONumber;
  }
  setPONumber(String data)
  {
    this.pONumber = data;
  }

  //getter and setter for which process the material has last completed
  String getProcess()
  {
    return this.processing;
  }
  setProcess(data)
  {
    this.processing = data;
  }

  //getter and setter for customer name
  String getCustomer()
  {
    return this.customer;
  }
  setCustomer(data)
  {
    this.customer = data;
  }

  //getter and setter for sales #
  String getSalesNumber()
  {
    return this.salesNumber;
  }
  setSalesNumber(data)
  {
    this.salesNumber = data;
  }

  //getter and setter for partNumber
  String getPartNumber()
  {
    return this.partNumber;
  }
  setPartNumber(data)
  {
    this.partNumber = data;
  }

  //getter and setter for the individual who created the item
  String getCreated()
  {
    return this.created;
  }
  setCreated(data)
  {
    this.created = data;
  }
  
  //later additions end
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

	void setImage(String newImage)
	{
		this.imageUrl = newImage;
	}

  String getUrl()
	{
		return this.imageUrl;
	}

	void setEmpty(bool emptyIn)
	{
		empty = emptyIn;
	}

}