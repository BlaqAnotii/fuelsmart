import 'package:event_bus_plus/event_bus_plus.dart';
import 'package:flutter_template/data/https.dart';

class ApplicationEvent extends AppEvent {
  final String message;
  final String type;
  final dynamic data;

  const ApplicationEvent(this.message, this.type, {this.data});
  @override
  List<Object?> get props => [userServices.cache.getRandomString(14)];
}
