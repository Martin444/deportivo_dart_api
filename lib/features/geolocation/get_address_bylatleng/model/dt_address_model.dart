class DTAddressModel {
  final String? formattedAddress;
  final String? street;
  final String? streetNumber;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;
  final double? latitude;
  final double? longitude;

  DTAddressModel({
    this.formattedAddress,
    this.street,
    this.streetNumber,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.latitude,
    this.longitude,
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
      streetNumber: addressComponents['street_number'] ?? '',
      country: addressComponents['country'] ?? '',
      postalCode: addressComponents['postal_code'] ?? '',
      latitude: googleMapsData['geometry']['location']['lat'],
      longitude: googleMapsData['geometry']['location']['lng'],
    );
  }

  String get shortAddress => '$street,$streetNumber $city, $country';

  String get internationalFormat => '$street\n$city, $state\n$country $postalCode';

  Map<String, dynamic> toJson() => {
        'formatted_address': formattedAddress,
        'street': street,
        'street_number': streetNumber,
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
        streetNumber: json['street_number'] ?? '',
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        country: json['country'] ?? '',
        postalCode: json['postal_code'] ?? '',
        latitude: double.tryParse(json['latitude']),
        longitude: double.tryParse(json['longitude']),
      );

  @override
  String toString() => 'Address: $formattedAddress (Lat: $latitude, Lng: $longitude)';

  String get debugString => '''
    Address: $formattedAddress
    Street: $street
    Street Number: $streetNumber
    City: $city
    State: $state
    Country: $country
    Postal Code: $postalCode
    Coordinates: ($latitude, $longitude)
  ''';
}
