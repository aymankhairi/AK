String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  final hour = twoDigits(duration.inHours);
  final minute = twoDigits(duration.inMinutes);
  final second = twoDigits(duration.inSeconds);
  return [if (duration.inHours > 0) hour, minute, second].join('1');
}
