import 'package:flutter/material.dart';
import 'package:wherehous/main.dart';


class Login extends StatefulWidget 
{

  	Login({Key key, this.title}) : super(key: key);
	final String title;

  	@override
  	LoginPage createState() => new LoginPage(); //FIX onboarding first?
}

class LoginPage extends State<Login>
{
	final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

	static bool hasLoggedIn()
	{
		return false;
	}

	void testConnection()
	{

	}
	void setUserInfo()
	{
	}

    @override
    Widget build(BuildContext context) 
    {
		/*if (hasLoggedIn())
		{
			Navigator.pop(context);
			Navigator.push
			(
				context,
				new MaterialPageRoute(builder: (context) => new Home()),
			);
		}*/
        return new Scaffold
        (
            body: new ListView
			(
				children:<Widget>
				[
					new Column
					(
						mainAxisAlignment: MainAxisAlignment.center,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>
						[
							new Padding
							( //TITLE
								padding: EdgeInsets.only(top: 64.0, left: 16.0, right: 16.0, bottom: 16.0),
								child: new Row
								(
									mainAxisAlignment: MainAxisAlignment.start,
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>
									[
										new IconTheme
										(
											data: new IconThemeData(size: 28.0),
											child: Icon(Icons.person_add),
										),

										new Text
										(
											' Login In',
											style: new TextStyle
											(
												fontWeight: FontWeight.bold,
												fontSize: 20.0,
												fontFamily: "RobotoMono",
											),
										)
									],
								),
							),

							new Form
							(
								key: _formKey,
								child: new Column
								(
									children: <Widget>
									[
										new Padding
										(
											padding: EdgeInsets.only(top: 16.0),
											child: new ListTile
											(
												title: new Padding
												(
													padding: EdgeInsets.only(bottom: 8.0),
													child: new Text
													(
														'Username:', 
														style: new TextStyle
														(
															fontFamily: 'RobotoMono',
															fontWeight: FontWeight.bold,
															fontSize: 12.0,
														),
													),
												),

												subtitle: new TextFormField
												(
													autocorrect: true,

													style: new TextStyle
													(
														color: Colors.black,
														fontFamily: "RobotoMono",
														fontSize: 16.0,
													),

													decoration: new InputDecoration
													(
														fillColor: Colors.grey[200],
														filled: true,
														hintText: "Eg: 'Ron Smith'",
														hintStyle: new TextStyle
														(
															color: Colors.grey[400],
															fontFamily: "RobotoMono",
															fontSize: 16.0,
														)
													),
												),
											),
										),

										new Padding
										(
											padding: EdgeInsets.only(top: 32.0),
											child: new ListTile
											(
												title: new Padding
												(
													padding: EdgeInsets.only(bottom: 8.0),
													child: new Text
													(
														'Server Address:', 
														style: new TextStyle
														(
															fontFamily: 'RobotoMono',
															fontWeight: FontWeight.bold,
															fontSize: 12.0,
														),
													),
												),

												subtitle: new TextFormField
												(
													autocorrect: false,

													style: new TextStyle
													(
														color: Colors.black,
														fontFamily: "RobotoMono",
														fontSize: 16.0,
													),

													decoration: new InputDecoration
													(
														fillColor: Colors.grey[200],
														filled: true,
													),
												),
											),
										),

										new Padding
										(
											padding: EdgeInsets.only(top: 16.0),
											child: new ListTile
											(
												title: new Padding
												(
													padding: EdgeInsets.only(bottom: 8.0),
													child: new Text
													(
														'Server Username:', 
														style: new TextStyle
														(
															fontFamily: 'RobotoMono',
															fontWeight: FontWeight.bold,
															fontSize: 12.0,
														),
													),
												),

												subtitle: new TextFormField
												(
													autocorrect: false,

													style: new TextStyle
													(
														color: Colors.black,
														fontFamily: "RobotoMono",
														fontSize: 16.0,
													),

													decoration: new InputDecoration
													(
														fillColor: Colors.grey[200],
														filled: true,
													),
												),
											),
										),

										new Padding
										(
											padding: EdgeInsets.only(top: 16.0),
											child: new ListTile
											(
												title: new Padding
												(
													padding: EdgeInsets.only(bottom: 8.0),
													child: new Text
													(
														'Server Password:', 
														style: new TextStyle
														(
															fontFamily: 'RobotoMono',
															fontWeight: FontWeight.bold,
															fontSize: 12.0,
														),
													),
												),

												subtitle: new TextFormField
												(
													autocorrect: false,

													style: new TextStyle
													(
														color: Colors.black,
														fontFamily: "RobotoMono",
														fontSize: 16.0,
													),

													decoration: new InputDecoration
													(
														fillColor: Colors.grey[200],
														filled: true,
													),
												),
											),
										),

										new Padding
										(
											padding: EdgeInsets.all(32.0),
											child: new FloatingActionButton.extended
											(
												backgroundColor: Colors.blue,
												icon: new Icon(Icons.send, color: Colors.white),
												label: new Padding
												(
													padding: EdgeInsets.symmetric(horizontal: 16.0),
													child: new Text
													(
														"Login", 
														style: new TextStyle
														(
															color: Colors.white,
															fontFamily: "RobotoMono",
															fontSize: 16.0,
														),
													),
												),
												
												onPressed: () 
												{
													testConnection();
													if (_formKey.currentState.validate())
													{
														_formKey.currentState.save();
														setUserInfo();
														Navigator.pop(context);
														Navigator.push
														(
															context,
															new MaterialPageRoute(builder: (context) => new Home()),
														);
													}
												},
											),
										)
									]
								)
							),
						],
					),
				],
            ),
        );
    }
}