import 'package:collection/collection.dart';

class Designation {
	String? abbreviated;
	String? expanded;

	Designation({this.abbreviated, this.expanded});

	@override
	String toString() {
		return 'Designation(abbreviated: $abbreviated, expanded: $expanded)';
	}

	factory Designation.fromJson(Map<String, dynamic> json) => Designation(
				abbreviated: json['abbreviated'] as String?,
				expanded: json['expanded'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'abbreviated': abbreviated,
				'expanded': expanded,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Designation) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => abbreviated.hashCode ^ expanded.hashCode;
}
