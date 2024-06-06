part of 'internet_cubit.dart';

enum ConectivityStatus{
  connected,
  disconnected
}
class InternetStatus{
  final ConectivityStatus status;
  const InternetStatus (this.status);
}