String extractDistrictFromAddress(String address) {
  final parts = address.trim().split(" ");
  final buffer = <String>[];

  for (final part in parts) {
    buffer.add(part);
    if (part.endsWith("동") || part.endsWith("읍") || part.endsWith("면")) {
      break;
    }
  }

  if (buffer.isNotEmpty &&
      (buffer.last.endsWith("동") ||
          buffer.last.endsWith("읍") ||
          buffer.last.endsWith("면"))) {
    return buffer.join(" ");
  } else if (parts.length >= 2 &&
      (parts[0].endsWith("시") || parts[0].endsWith("도"))) {
    return "${parts[0]} ${parts[1]}";
  }

  return "";
}
