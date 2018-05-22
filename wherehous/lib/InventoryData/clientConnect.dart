import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';
import 'dart:async';
import 'package:wherehous/dataObj.dart';


class MyConnection /// WARNING! CLOSE pool using pool.closeConnectionNow(); --- it will not on its own
{
  // we will hard code the connectionpool, it shouldn't change
  var pool = new ConnectionPool(
    host: 'insert ip address',
    port: 1337, user: 'insert username for server login',
    password: 'password',
    db: 'name of database',
    max: 5 // max is the max size of a payload package in mb (might want to double check units)
  );// everything is placeholder  

  var sql;  // whatever sql command u wish to pass -------------- We will hardcode our query
  var results; //  = await pool.query(sql);         ------------- results will always be null until u getInvList, cant perform await unless async

  MyConnection(this.pool);

  MyConnection.map(dynamic obj)
  {
    
  }

  Future run() async 
  {
    await addData();
    await readData();
  }
  
  Future addData() async
  {
    print('QUERYING');
    var query = await this.pool.prepare(
      "insert into 'Insert Inventory Title Here' (title, productNumber, location, position, quantity, tearWeight, totalWeight) values (?,?,?,?,?,?)"
      );
    print('addData Query has been prepared');
    var parameters =
    [
      ["Item.title", "Item.productNumber", "Item.getlocation", "Item.position", "Item.quantity", "Item.tearWeight", "Item.totalWeight"]
    ];

    await query.executeMulti(parameters);
    print('Data has successfully been added to Table');
  }

  Future readData() async
  {
    print('QUERYING');
    var result =
    await this.pool.query(
      'select p.id, p.name, p.age, t.name, t.species ' // place holders until we know architecture 
            'from people p ' // place holders until we know architecture 
            'left join pets t on t.owner_id = p.id'); // place holders until we know architecture 
    print("got results");
    return result.forEach((row) {
      if (row[3] == null) { // i will probably just use the join() function on all the Strings in row and we will parse it ourselves
        print("ID: ${row[0]}, Name: ${row[1]}, Age: ${row[2]}, No Pets"); // place holders until we know architecture 
      } else {
        print(
            "ID: ${row[0]}, Name: ${row[1]}, Age: ${row[2]}, Pet Name: ${row[3]}, Pet Species ${row[4]}"); // place holders until we know architecture 
      }
    });
  }
}
//  String title;
//   String productNumber;
//   String location;
//   String position; 
//   String quantity;
//   String tearWeight; // tear weight
//   String totalWeight; // total weight
//   String lastEdit; // tracks whoever last edited an item
//   bool empty;

//// if there exists a file of all the data for connection
// OptionsFile options = new OptionsFile('connection.options');
//   String user = options.getString('user');
//   String password = options.getString('password');
//   int port = options.getInt('port', 3306);
//   String db = options.getString('db');
//   String host = options.getString('host', 'localhost');
