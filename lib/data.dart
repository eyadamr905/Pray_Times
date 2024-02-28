// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
    final int code;
    final String status;
    final List<Datum> data;

    Data({
        required this.code,
        required this.status,
        required this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json["code"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final Timings timings;
    final Date date;
    final Meta meta;

    Datum({
        required this.timings,
        required this.date,
        required this.meta,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        timings: Timings.fromJson(json["timings"]),
        date: Date.fromJson(json["date"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "timings": timings.toJson(),
        "date": date.toJson(),
        "meta": meta.toJson(),
    };
}

class Date {
    final String readable;
    final String timestamp;
    final Gregorian gregorian;
    final Hijri hijri;

    Date({
        required this.readable,
        required this.timestamp,
        required this.gregorian,
        required this.hijri,
    });

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        readable: json["readable"],
        timestamp: json["timestamp"],
        gregorian: Gregorian.fromJson(json["gregorian"]),
        hijri: Hijri.fromJson(json["hijri"]),
    );

    Map<String, dynamic> toJson() => {
        "readable": readable,
        "timestamp": timestamp,
        "gregorian": gregorian.toJson(),
        "hijri": hijri.toJson(),
    };
}

class Gregorian {
    final String date;
    final Format format;
    final String day;
    final GregorianWeekday weekday;
    final GregorianMonth month;
    final String year;
    final Designation designation;

    Gregorian({
        required this.date,
        required this.format,
        required this.day,
        required this.weekday,
        required this.month,
        required this.year,
        required this.designation,
    });

    factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json["date"],
        format: formatValues.map[json["format"]]!,
        day: json["day"],
        weekday: GregorianWeekday.fromJson(json["weekday"]),
        month: GregorianMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "format": formatValues.reverse[format],
        "day": day,
        "weekday": weekday.toJson(),
        "month": month.toJson(),
        "year": year,
        "designation": designation.toJson(),
    };
}

class Designation {
    final Abbreviated abbreviated;
    final Expanded expanded;

    Designation({
        required this.abbreviated,
        required this.expanded,
    });

    factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: abbreviatedValues.map[json["abbreviated"]]!,
        expanded: expandedValues.map[json["expanded"]]!,
    );

    Map<String, dynamic> toJson() => {
        "abbreviated": abbreviatedValues.reverse[abbreviated],
        "expanded": expandedValues.reverse[expanded],
    };
}

enum Abbreviated {
    AD,
    AH
}

final abbreviatedValues = EnumValues({
    "AD": Abbreviated.AD,
    "AH": Abbreviated.AH
});

enum Expanded {
    ANNO_DOMINI,
    ANNO_HEGIRAE
}

final expandedValues = EnumValues({
    "Anno Domini": Expanded.ANNO_DOMINI,
    "Anno Hegirae": Expanded.ANNO_HEGIRAE
});

enum Format {
    DD_MM_YYYY
}

final formatValues = EnumValues({
    "DD-MM-YYYY": Format.DD_MM_YYYY
});

class GregorianMonth {
    final int number;
    final PurpleEn en;

    GregorianMonth({
        required this.number,
        required this.en,
    });

    factory GregorianMonth.fromJson(Map<String, dynamic> json) => GregorianMonth(
        number: json["number"],
        en: purpleEnValues.map[json["en"]]!,
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "en": purpleEnValues.reverse[en],
    };
}

enum PurpleEn {
    APRIL
}

final purpleEnValues = EnumValues({
    "April": PurpleEn.APRIL
});

class GregorianWeekday {
    final String en;

    GregorianWeekday({
        required this.en,
    });

    factory GregorianWeekday.fromJson(Map<String, dynamic> json) => GregorianWeekday(
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
    };
}

class Hijri {
    final String date;
    final Format format;
    final String day;
    final HijriWeekday weekday;
    final HijriMonth month;
    final String year;
    final Designation designation;
    final List<String> holidays;

    Hijri({
        required this.date,
        required this.format,
        required this.day,
        required this.weekday,
        required this.month,
        required this.year,
        required this.designation,
        required this.holidays,
    });

    factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
        date: json["date"],
        format: formatValues.map[json["format"]]!,
        day: json["day"],
        weekday: HijriWeekday.fromJson(json["weekday"]),
        month: HijriMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
        holidays: List<String>.from(json["holidays"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "format": formatValues.reverse[format],
        "day": day,
        "weekday": weekday.toJson(),
        "month": month.toJson(),
        "year": year,
        "designation": designation.toJson(),
        "holidays": List<dynamic>.from(holidays.map((x) => x)),
    };
}

class HijriMonth {
    final int number;
    final FluffyEn en;
    final Ar ar;

    HijriMonth({
        required this.number,
        required this.en,
        required this.ar,
    });

    factory HijriMonth.fromJson(Map<String, dynamic> json) => HijriMonth(
        number: json["number"],
        en: fluffyEnValues.map[json["en"]]!,
        ar: arValues.map[json["ar"]]!,
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "en": fluffyEnValues.reverse[en],
        "ar": arValues.reverse[ar],
    };
}

enum Ar {
    AR,
    EMPTY
}

final arValues = EnumValues({
    "شَعْبان": Ar.AR,
    "رَجَب": Ar.EMPTY
});

enum FluffyEn {
    RAJAB,
    SHA_BN
}

final fluffyEnValues = EnumValues({
    "Rajab": FluffyEn.RAJAB,
    "Shaʿbān": FluffyEn.SHA_BN
});

class HijriWeekday {
    final String en;
    final String ar;

    HijriWeekday({
        required this.en,
        required this.ar,
    });

    factory HijriWeekday.fromJson(Map<String, dynamic> json) => HijriWeekday(
        en: json["en"],
        ar: json["ar"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
    };
}

class Meta {
    final double latitude;
    final double longitude;
    final Timezone timezone;
    final Method method;
    final LatitudeAdjustmentMethod latitudeAdjustmentMethod;
    final MidnightMode midnightMode;
    final MidnightMode school;
    final Map<String, int> offset;

    Meta({
        required this.latitude,
        required this.longitude,
        required this.timezone,
        required this.method,
        required this.latitudeAdjustmentMethod,
        required this.midnightMode,
        required this.school,
        required this.offset,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        timezone: timezoneValues.map[json["timezone"]]!,
        method: Method.fromJson(json["method"]),
        latitudeAdjustmentMethod: latitudeAdjustmentMethodValues.map[json["latitudeAdjustmentMethod"]]!,
        midnightMode: midnightModeValues.map[json["midnightMode"]]!,
        school: midnightModeValues.map[json["school"]]!,
        offset: Map.from(json["offset"]).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezoneValues.reverse[timezone],
        "method": method.toJson(),
        "latitudeAdjustmentMethod": latitudeAdjustmentMethodValues.reverse[latitudeAdjustmentMethod],
        "midnightMode": midnightModeValues.reverse[midnightMode],
        "school": midnightModeValues.reverse[school],
        "offset": Map.from(offset).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

enum LatitudeAdjustmentMethod {
    ANGLE_BASED
}

final latitudeAdjustmentMethodValues = EnumValues({
    "ANGLE_BASED": LatitudeAdjustmentMethod.ANGLE_BASED
});

class Method {
    final int id;
    final Name name;
    final Params params;
    final Location location;

    Method({
        required this.id,
        required this.name,
        required this.params,
        required this.location,
    });

    factory Method.fromJson(Map<String, dynamic> json) => Method(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        params: Params.fromJson(json["params"]),
        location: Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "params": params.toJson(),
        "location": location.toJson(),
    };
}

class Location {
    final double latitude;
    final double longitude;

    Location({
        required this.latitude,
        required this.longitude,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

enum Name {
    ISLAMIC_SOCIETY_OF_NORTH_AMERICA_ISNA
}

final nameValues = EnumValues({
    "Islamic Society of North America (ISNA)": Name.ISLAMIC_SOCIETY_OF_NORTH_AMERICA_ISNA
});

class Params {
    final int fajr;
    final int isha;

    Params({
        required this.fajr,
        required this.isha,
    });

    factory Params.fromJson(Map<String, dynamic> json) => Params(
        fajr: json["Fajr"],
        isha: json["Isha"],
    );

    Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Isha": isha,
    };
}

enum MidnightMode {
    STANDARD
}

final midnightModeValues = EnumValues({
    "STANDARD": MidnightMode.STANDARD
});

enum Timezone {
    EUROPE_LONDON
}

final timezoneValues = EnumValues({
    "Europe/London": Timezone.EUROPE_LONDON
});

class Timings {
    final String fajr;
    final String sunrise;
    final String dhuhr;
    final String asr;
    final String sunset;
    final String maghrib;
    final String isha;
    final String imsak;
    final String midnight;
    final String firstthird;
    final String lastthird;

    Timings({
        required this.fajr,
        required this.sunrise,
        required this.dhuhr,
        required this.asr,
        required this.sunset,
        required this.maghrib,
        required this.isha,
        required this.imsak,
        required this.midnight,
        required this.firstthird,
        required this.lastthird,
    });

    factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        imsak: json["Imsak"],
        midnight: json["Midnight"],
        firstthird: json["Firstthird"],
        lastthird: json["Lastthird"],
    );

    Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Sunset": sunset,
        "Maghrib": maghrib,
        "Isha": isha,
        "Imsak": imsak,
        "Midnight": midnight,
        "Firstthird": firstthird,
        "Lastthird": lastthird,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
