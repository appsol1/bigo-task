import 'package:bigo_task/globals.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeModel {
  int id = 0;
  String? location;
  String? beds;
  String? baths;
  String? price;
  DateTime? createdAt;
  HomeImage? image;

  HomeModel({required this.id, this.location, this.beds, this.baths, this.price, this.createdAt, this.image});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        id: json['id'],
        location: json['location'],
        beds: json['beds'],
        baths: json['baths'],
        price: json['price'],
        createdAt: DateTime.parse(json['created_at']),
        image: json['img'] != null ? HomeImage.fromJson(json['img']) : null);
  }

  String getImageUrl() {
    if (image == null) {
      return '';
    } else {
      return image?.getThumbnailUrl() as String;
    }
  }

  String getTimeDiff() {
    var now = new DateTime.now();
    final diff = now.subtract(now.difference(createdAt!));

    return timeago.format(diff);
  }
}

class HomeImage {
  int id = 0;
  String? name;
  int? width;
  int? height;
  Map? formats;
  String? ext;
  String? url;

  HomeImage({required this.id, this.name, this.width, this.height, this.formats, this.ext, this.url});

  factory HomeImage.fromJson(Map<String, dynamic> json) {
    return HomeImage(
        id: json['id'],
        name: json['name'],
        width: json['width'],
        height: json['height'],
        formats: json['formats'],
        ext: json['ext'],
        url: json['url']);
  }

  String getThumbnailUrl() {
    var thumbFormat = formats?['thumbnail'];
    return thumbFormat != null ? globals.apiUrl + thumbFormat['url'] : globals.apiUrl + url!;
  }
}
