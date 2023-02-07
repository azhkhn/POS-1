
class LocationDataDestination {

  final String? latitude;
  final String? longitude;
  final String status;

  const LocationDataDestination({
    this.latitude,
    this.longitude,
    required this.status
  });

  factory LocationDataDestination.fromJson(Map<String, dynamic> json) {
    return LocationDataDestination(
      latitude: json['LATITUDE'],
      longitude: json['LONGITUDE'],
      status: json['STATUS']
    );
  }
}
