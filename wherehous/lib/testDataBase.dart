import 'dataObj.dart';

class DataBase
{
	List<Item> itemArray; 
	List<int> inSearch;
	List<Item> notInSearch;

	DataBase()
	{
		itemArray = [];
		inSearch = [];
		notInSearch = [];
	}

	void newItem({String title: '', String productNumber: '', String location: '', String position: '',  
		String quantity: '',  String tearWeight: '',  String totalWeight: '',  String lastEdit: '', bool empty: true, image})
	{
		itemArray.add(new Item(title, productNumber, location, position, quantity, tearWeight, totalWeight, lastEdit, empty, image));
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
		itemArray.removeAt(id);
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