import 'package:collection/collection.dart';

class Timings {
	String? fajr;
	String? sunrise;
	String? dhuhr;
	String? asr;
	String? sunset;
	String? maghrib;
	String? isha;
	String? imsak;
	String? midnight;
	String? firstthird;
	String? lastthird;

	Timings({
		this.fajr, 
		this.sunrise, 
		this.dhuhr, 
		this.asr, 
		this.sunset, 
		this.maghrib, 
		this.isha, 
		this.imsak, 
		this.midnight, 
		this.firstthird, 
		this.lastthird, 
	});

	@override
	String toString() {
		return 'Timings(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, sunset: $sunset, maghrib: $maghrib, isha: $isha, imsak: $imsak, midnight: $midnight, firstthird: $firstthird, lastthird: $lastthird)';
	}

	factory Timings.fromJson(Map<String, dynamic> json) => Timings(
				fajr: json['Fajr'] as String?,
				sunrise: json['Sunrise'] as String?,
				dhuhr: json['Dhuhr'] as String?,
				asr: json['Asr'] as String?,
				sunset: json['Sunset'] as String?,
				maghrib: json['Maghrib'] as String?,
				isha: json['Isha'] as String?,
				imsak: json['Imsak'] as String?,
				midnight: json['Midnight'] as String?,
				firstthird: json['Firstthird'] as String?,
				lastthird: json['Lastthird'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'Fajr': fajr,
				'Sunrise': sunrise,
				'Dhuhr': dhuhr,
				'Asr': asr,
				'Sunset': sunset,
				'Maghrib': maghrib,
				'Isha': isha,
				'Imsak': imsak,
				'Midnight': midnight,
				'Firstthird': firstthird,
				'Lastthird': lastthird,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Timings) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			fajr.hashCode ^
			sunrise.hashCode ^
			dhuhr.hashCode ^
			asr.hashCode ^
			sunset.hashCode ^
			maghrib.hashCode ^
			isha.hashCode ^
			imsak.hashCode ^
			midnight.hashCode ^
			firstthird.hashCode ^
			lastthird.hashCode;
}
