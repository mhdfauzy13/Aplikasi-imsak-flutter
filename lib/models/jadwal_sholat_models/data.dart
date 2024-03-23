import 'package:collection/collection.dart';

import 'date.dart';
import 'meta.dart';
import 'timings.dart';

class Data {
	Timings? timings;
	Date? date;
	Meta? meta;

	Data({this.timings, this.date, this.meta});

	@override
	String toString() => 'Data(timings: $timings, date: $date, meta: $meta)';

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				timings: json['timings'] == null
						? null
						: Timings.fromJson(json['timings'] as Map<String, dynamic>),
				date: json['date'] == null
						? null
						: Date.fromJson(json['date'] as Map<String, dynamic>),
				meta: json['meta'] == null
						? null
						: Meta.fromJson(json['meta'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'timings': timings?.toJson(),
				'date': date?.toJson(),
				'meta': meta?.toJson(),
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Data) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => timings.hashCode ^ date.hashCode ^ meta.hashCode;
}
