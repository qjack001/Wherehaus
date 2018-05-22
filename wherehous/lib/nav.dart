import 'package:flutter/material.dart';
import 'package:wherehous/main.dart';


class Nav
{
	static StatefulWidget EDIT_PAGE = new Edit();
	static StatefulWidget SEARCH_PAGE = new Search();
	static StatefulWidget LOGIN_PAGE = new Login();
	static StatefulWidget PRODUCT_PAGE = new Product();
	static StatefulWidget NEW_EDIT_PAGE = new NewEdit();
	static StatefulWidget HOME_PAGE = new Home();

	static void push(StatefulWidget page, BuildContext context)
	{
		Navigator.push(context, new MaterialPageRoute(builder: (context) => page));
	}

	static void pushReplace(StatefulWidget page, BuildContext context)
	{
		Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => page));
	}

	static void pop(BuildContext context)
	{
		Navigator.pop(context);
	}
}