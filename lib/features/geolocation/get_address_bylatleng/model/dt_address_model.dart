class DTAddressModel {
  final String formattedAddress;
  final String street;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final double latitude;
  final double longitude;

  DTAddressModel({
    required this.formattedAddress,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.latitude,
    required this.longitude,
  });

  factory DTAddressModel.fromGoogleMaps(Map<String, dynamic> googleMapsData) {
    var addressComponents = {
      for (var component in googleMapsData['address_components']) component['types'][0]: component['long_name']
    };

    return DTAddressModel(
      formattedAddress: googleMapsData['formatted_address'] ?? '',
      street: addressComponents['route'] ?? '',
      city: addressComponents['locality'] ?? '',
      state: addressComponents['administrative_area_level_1'] ?? '',
      country: addressComponents['country'] ?? '',
      postalCode: addressComponents['postal_code'] ?? '',
      latitude: googleMapsData['geometry']['location']['lat'],
      longitude: googleMapsData['geometry']['location']['lng'],
    );
  }

  String get shortAddress => '$street, $city, $country';

  String get internationalFormat => '$street\n$city, $state\n$country $postalCode';

  Map<String, dynamic> toJson() => {
        'formatted_address': formattedAddress,
        'street': street,
        'city': city,
        'state': state,
        'country': country,
        'postal_code': postalCode,
        'latitude': latitude,
        'longitude': longitude,
      };

  static fromJson(Map<String, dynamic> json) => DTAddressModel(
        formattedAddress: json['formatted_address'] ?? '',
        street: json['street'] ?? '',
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        country: json['country'] ?? '',
        postalCode: json['postal_code'] ?? '',
        latitude: json['latitude']?.toDouble() ?? 0.0,
        longitude: json['longitude']?.toDouble() ?? 0.0,
      );

  @override
  String toString() => 'Address: $formattedAddress (Lat: $latitude, Lng: $longitude)';

  String get debugString => '''
    Address: $formattedAddress
    Street: $street
    City: $city
    State: $state
    Country: $country
    Postal Code: $postalCode
    Coordinates: ($latitude, $longitude)
  ''';
}
