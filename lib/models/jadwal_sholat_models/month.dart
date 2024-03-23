import 'package:collection/collection.dart';

class Month {
	int? number;
	String? en;
	String? ar;

	Month({this.number, this.en, this.ar});

	@override
	String toString() => 'Month(number: $number, en: $en, ar: $ar)';

	factory Month.fromJson(Map<String, dynamic> json) => Month(
				number: json['number'] as int?,
				en: json['en'] as String?,
				ar: json['ar'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'number': number,
				'en': en,
				'ar': ar,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Month) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => number.hashCode ^ en.hashCode ^ ar.hashCode;
}
