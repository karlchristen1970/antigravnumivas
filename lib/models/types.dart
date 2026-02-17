class Coin {
  final String id;
  final String name;
  final String grade;
  final String metal;
  final String certNumber;
  final String image;
  final String agency; // 'PCGS' | 'NGC'
  final double value;

  const Coin({
    required this.id,
    required this.name,
    required this.grade,
    required this.metal,
    required this.certNumber,
    required this.image,
    required this.agency,
    required this.value,
  });
}

class Unit {
  final String id;
  final String name;
  final String location;
  final int coinCount;
  final double temp;
  final double humidity;
  final String status; // 'Secure' | 'Warning' | 'Locked'
  final String image;
  final int slots;
  final String description;

  const Unit({
    required this.id,
    required this.name,
    required this.location,
    required this.coinCount,
    required this.temp,
    required this.humidity,
    required this.status,
    required this.image,
    required this.slots,
    required this.description,
  });
}

class LogEntry {
  final String id;
  final String time;
  final String event;
  final String status; // 'Success' | 'Resolved' | 'Complete' | 'Failed'
  final String device;

  const LogEntry({
    required this.id,
    required this.time,
    required this.event,
    required this.status,
    required this.device,
  });
}

class Partner {
  final String id;
  final String name;
  final String location;
  final String description;
  final String initial;

  const Partner({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.initial,
  });
}
