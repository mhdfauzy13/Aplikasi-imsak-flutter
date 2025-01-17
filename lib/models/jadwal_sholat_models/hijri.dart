import 'package:collection/collection.dart';

import 'designation.dart';
import 'month.dart';
import 'weekday.dart';

class Hijri {
	String? date;
	String? format;
	String? day;
	Weekday? weekday;
	Month? month;
	String? year;
	Designation? designation;
	List<dynamic>? holidays;

	Hijri({
		this.date, 
		this.format, 
		this.day, 
		this.weekday, 
		this.month, 
		this.year, 
		this.designation, 
		this.holidays, 
	});

	@override
	String toString() {
		return 'Hijri(date: $date, format: $format, day: $day, weekday: $weekday, month: $month, year: $year, designation: $designation, holidays: $holidays)';
	}

	factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
				date: json['date'] as String?,
				format: json['format'] as String?,
				day: json['day'] as String?,
				weekday: json['weekday'] == null
						? null
						: Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
				month: json['month'] == null
						? null
						: Month.fromJson(json['month'] as Map<String, dynamic>),
				year: json['year'] as String?,
				designation: json['designation'] == null
						? null
						: Designation.fromJson(json['designation'] as Map<String, dynamic>),
				holidays: json['holidays'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'date': date,
				'format': format,
				'day': day,
				'weekday': weekday?.toJson(),
				'month': month?.toJson(),
				'year': year,
				'designation': designation?.toJson(),
				'holidays': holidays,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Hijri) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			date.hashCode ^
			format.hashCode ^
			day.hashCode ^
			weekday.hashCode ^
			month.hashCode ^
			year.hashCode ^
			designation.hashCode ^
			holidays.hashCode;
}
