enum DifficulityLevel { easy, medium, hard }

DifficulityLevel getDifficulityLevel(String name) {
  switch (name) {
    case "easy":
      return DifficulityLevel.easy;
    case "medium":
      return DifficulityLevel.medium;
    case "hard":
      return DifficulityLevel.hard;
    default:
      return DifficulityLevel.easy;
  }
}

enum Priority {
  low,
  medium,
  high,
  urgent,
}

Priority getPriority(String name) {
  switch (name) {
    case "low":
      return Priority.low;
    case "medium":
      return Priority.medium;
    case "high":
      return Priority.high;
    case "urgent":
      return Priority.urgent;
    default:
      return Priority.low;
  }
}

String getPriorityName(Priority priority) {
  switch (priority) {
    case Priority.low:
      return "low";
    case Priority.medium:
      return "medium";
    case Priority.high:
      return "high";
    case Priority.urgent:
      return "urgent";
    default:
      return "low";
  }
}

String getDifficulityLevelName(DifficulityLevel difficulityLevel) {
  switch (difficulityLevel) {
    case DifficulityLevel.easy:
      return "easy";
    case DifficulityLevel.medium:
      return "medium";
    case DifficulityLevel.hard:
      return "hard";
    default:
      return "easy";
  }
}
