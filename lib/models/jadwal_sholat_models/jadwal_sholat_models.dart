import 'package:collection/collection.dart';

import 'data.dart';

class JadwalSholatModels {
	int? code;
	String? status;
	Data? data;

	JadwalSholatModels({this.code, this.status, this.data});

	@override
	String toString() {
		return 'JadwalSholatModels(code: $code, status: $status, data: $data)';
	}

	factory JadwalSholatModels.fromJson(Map<String, dynamic> json) {
		return JadwalSholatModels(
			code: json['code'] as int?,
			status: json['status'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'code': code,
				'status': status,
				'data': data?.toJson(),
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! JadwalSholatModels) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => code.hashCode ^ status.hashCode ^ data.hashCode;
}
