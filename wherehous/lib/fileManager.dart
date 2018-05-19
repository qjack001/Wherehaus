import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DataStorage 
{
	Future<String> get _localPath async 
	{
		final directory = await getApplicationDocumentsDirectory();
		return directory.path;
	}

	Future<File> get _localFile async 
	{
		final path = await _localPath;
		return new File('$path/data.txt');
	}

	Future<List<String>> readIn() async 
	{
		try 
		{
			final file = await _localFile;

			// Read the file
			String contents = await file.readAsString();
			List<String> formattedContents = contents.split("\n");

			return formattedContents;
		} 
		catch (e) 
		{
			return [];
		}
	}

	Future<File> writeData(String data) async 
	{
		final file = await _localFile;

		// Write the file
		return file.writeAsString('$data');
	}
}