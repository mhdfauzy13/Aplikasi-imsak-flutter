import 'package:collection/collection.dart';

import 'location.dart';
import 'params.dart';

class Method {
	int? id;
	String? name;
	Params? params;
	Location? location;

	Method({this.id, this.name, this.params, this.location});

	@override
	String toString() {
		return 'Method(id: $id, name: $name, params: $params, location: $location)';
	}

	factory Method.fromJson(Map<String, dynamic> json) => Method(
				id: json['id'] as int?,
				name: json['name'] as String?,
				params: json['params'] == null
						? null
						: Params.fromJson(json['params'] as Map<String, dynamic>),
				location: json['location'] == null
						? null
						: Location.fromJson(json['location'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'params': params?.toJson(),
				'location': location?.toJson(),
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Method) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			id.hashCode ^
			name.hashCode ^
			params.hashCode ^
			location.hashCode;
}
