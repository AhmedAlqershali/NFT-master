import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  File? _selectedFile;


  // Function to choose a file from the device
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    } else {
      // User canceled the file picker
    }
  }

  // Function to upload the selected file
  Future<void> _uploadFile() async {
    if (_selectedFile == null) {
      // Handle the case when no file is selected.
      return;
    }

    final url = Uri.parse('https://storesuadia-001-site1.etempurl.com/api/Products/UploadProduct');
    final request = http.MultipartRequest('POST', url);

    // Attach the file to the request
    request.files.add(await http.MultipartFile.fromPath('file', _selectedFile!.path));

    // Send the request
    final response = await request.send();

    // Handle the response as needed
    if (response.statusCode == 200) {
      // File uploaded successfully
      print('File uploaded');
    } else {
      // Handle the error
      print('File upload failed with status ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _selectedFile == null
                ? Text('No file selected')
                : Text('Selected File: ${_selectedFile!.path}'),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Select File'),
            ),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text('Upload File'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: FileUploadScreen(),
));