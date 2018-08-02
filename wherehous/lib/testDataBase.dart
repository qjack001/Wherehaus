import 'dataObj.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;

class DataBase
{
	List<Item> itemArray; 
	List<int> inSearch;
	List<Item> notInSearch;
  DatabaseReference itemRef;

	DataBase()
	{
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRef = database.reference().child('items');

		itemArray = [];

		inSearch = [];
		notInSearch = [];

    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);
    itemRef.onChildRemoved.listen(_onEntryRemoved);
	}
	
  void newItem({String title: '', String productNumber: '', String location: '', String position: '',
  String quantity: '',  String tearWeight: '',  String totalWeight: '',  String lastEdit: '', bool empty: true, image, newLat, newLong})
	{
    Item item = new Item(title, productNumber, location, position, quantity, tearWeight, totalWeight, lastEdit, empty, image, newLat, newLong);
		//itemArray.add(new Item(title, productNumber, location, position, quantity, tearWeight, totalWeight, lastEdit, empty, image));
    //itemArray.add(item);
    itemRef.push().set(item.toJson()); // newGps));
  }

  void edit(itemId, editNum, newValue)
  {
    var itemValue = "";
    switch (editNum)
		{
			case 0:
				itemValue = "title";
				break;
			case 1:
				itemValue = "productNumber";
				break;
			case 2:
				itemValue = "location";
				break;
			case 3:
				itemValue = "position";
				break;
			case 4:
				itemValue = "quantity";
				break;
			case 5:
				itemValue = "tearWeight";
				break;
			case 6:
				itemValue = "totalWeight";
				break;
			case 7:
				itemValue = "lastEdit";
				break;
		}
    var itemKey = itemArray[itemId].key;
    itemRef.child(itemKey).child(itemValue).set(newValue);
  }
  
  _onEntryAdded(Event event) 
  {
    itemArray.add(Item.fromSnapshot(event.snapshot));
  }

  _onEntryChanged(Event event) 
  {
    //detect which item is effected, replace
    var old = this.itemArray.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    itemArray[itemArray.indexOf(old)] = Item.fromSnapshot(event.snapshot);
  }

  _onEntryRemoved(Event event) 
  {
    //detect which item is effected, remove from list
    var old = this.itemArray.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    itemArray.removeAt(itemArray.indexOf(old));
  }

  List<Item> fireBasePull()
  {
    List<Item> updatedList;

    return updatedList;
  }

  List<Item> fireBaseSync()
  {
    List<Item> updatedList;

    return updatedList;
  }

	List getDatabase()
	{
		return this.itemArray;
	}

	List getSearch()
	{
		return this.inSearch;
	}

	void delete(int id)
	{
    itemRef.child(itemArray[id].key).remove();
	}

	void search(String input, int id)
	{
		//exact match
		notInSearch.forEach((value)
		{
			if (value.getInfo(id).toLowerCase() == input.toLowerCase())
			{
				inSearch.add(itemArray.indexOf(value));
			}
		});

		notInSearch.removeWhere((value) => value.getInfo(id).toLowerCase() == input.toLowerCase());
		
		//similar titles
		notInSearch.forEach((value)
		{
			if (value.getInfo(id).toLowerCase().contains(input.toLowerCase()))
			{
				inSearch.add(itemArray.indexOf(value));
			}
		});

		notInSearch.removeWhere((value) => value.getInfo(id).toLowerCase().contains(input.toLowerCase()));
	}

	void update(String input)
	{
    inSearch = [];
		notInSearch = [];

		notInSearch.addAll(itemArray.reversed);

		for (int i = 0; i < 7; i++)
		{
			search(input, i);
		}
	}
}