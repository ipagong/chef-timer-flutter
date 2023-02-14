extension FormatDuration on Duration {
  String toTimer() {
    String minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
