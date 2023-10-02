class Location {
  late int start;
  late int end;
  late String fileName;

  Location({
    required this.start,
    required this.end,
    required this.fileName,
  });

  Location.fromAst(Map<String, dynamic> ast) {
    start = int.tryParse(ast['start'].toString())!;
    end = int.tryParse(ast['end'].toString())!;
    fileName = ast['filename'].toString();
  }
}

abstract class LocationArg {
  Location? location;

  LocationArg({this.location});
}
