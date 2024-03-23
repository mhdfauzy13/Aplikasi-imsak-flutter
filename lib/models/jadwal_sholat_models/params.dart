import 'package:collection/collection.dart';

class Params {
	double? fajr;
	double? isha;

	Params({this.fajr, this.isha});

	@override
	String toString() => 'Params(fajr: $fajr, isha: $isha)';

	factory Params.fromJson(Map<String, dynamic> json) => Params(
				fajr: (json['Fajr'] as num?)?.toDouble(),
				isha: (json['Isha'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'Fajr': fajr,
				'Isha': isha,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Params) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => fajr.hashCode ^ isha.hashCode;
}
