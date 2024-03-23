import 'package:collection/collection.dart';

import 'gregorian.dart';
import 'hijri.dart';

class Date {
	String? readable;
	String? timestamp;
	Hijri? hijri;
	Gregorian? gregorian;

	Date({this.readable, this.timestamp, this.hijri, this.gregorian});

	@override
	String toString() {
		return 'Date(readable: $readable, timestamp: $timestamp, hijri: $hijri, gregorian: $gregorian)';
	}

	factory Date.fromJson(Map<String, dynamic> json) => Date(
				readable: json['readable'] as String?,
				timestamp: json['timestamp'] as String?,
				hijri: json['hijri'] == null
						? null
						: Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
				gregorian: json['gregorian'] == null
						? null
						: Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'readable': readable,
				'timestamp': timestamp,
				'hijri': hijri?.toJson(),
				'gregorian': gregorian?.toJson(),
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Date) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			readable.hashCode ^
			timestamp.hashCode ^
			hijri.hashCode ^
			gregorian.hashCode;
}
