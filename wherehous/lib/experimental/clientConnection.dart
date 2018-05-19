import 'dart:io';

import "package:ssrp/ssrp.dart" as ssrp;
//import 'package:ssrp/ssrp.dart';
//import "package:logging/logging.dart";

class ClientConnection 
{
  var client = new ssrp.Client();
  var instance; // holds instances on connected client server 
  var instanceName; // target instance on webserver, many machines will be on this ip so definately will be needed
  var instanceList;

  String ipAddress; // ip address of target server
  var server;

  ClientConnection(this.client, this.instanceName, this.ipAddress);

  ClientConnection.map(dynamic obj)
  {
    server = new InternetAddress(ipAddress);
    instance = this.client.listInstances(server, instanceName);
    instanceList = this.client.listInstances(server);
  }

  getInstance()
  {
    return this.instance;
  }

  getInstanceList()
  {
    return this.instanceList;
  }

  getServer()
  {
    return this.server;
  }
}
