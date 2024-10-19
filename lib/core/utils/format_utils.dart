String formatHourMin(int durationInMinutes) {
  int hours = durationInMinutes ~/ 60;
  int minues = durationInMinutes % 60;
  if (hours > 0) {
    return '${hours}h$minues';
  } else {
    return '${minues}m';
  }
}
