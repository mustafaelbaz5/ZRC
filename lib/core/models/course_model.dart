enum CourseStatus {
  draft,
  pending,
  published,
  rejected;

  String get value {
    switch (this) {
      case CourseStatus.draft:
        return 'draft';
      case CourseStatus.pending:
        return 'pending';
      case CourseStatus.published:
        return 'published';
      case CourseStatus.rejected:
        return 'rejected';
    }
  }

  static CourseStatus fromString(final String value) {
    return CourseStatus.values.firstWhere(
      (final s) => s.value == value.toLowerCase(),
      orElse: () => CourseStatus.draft,
    );
  }
}

class CourseModel {
  final String id;
  final int instructorCode;

  final String title;
  final String description;
  final String category;

  final String youtubeUrl;
  final String? thumbnailUrl;

  final CourseStatus status;
  final String? rejectionReason;

  final List<String> learningPoints;
  final List<String> requirements;

  final int totalViews;
  final double averageRating;
  final int totalRatings;

  final DateTime createdAt;
  final DateTime updatedAt;

  const CourseModel({
    required this.id,
    required this.instructorCode,
    required this.title,
    required this.description,
    required this.category,
    required this.youtubeUrl,
    this.thumbnailUrl,
    required this.status,
    this.rejectionReason,
    this.learningPoints = const [],
    this.requirements = const [],
    this.totalViews = 0,
    this.averageRating = 0.0,
    this.totalRatings = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseModel.fromJson(final Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as String,
      instructorCode: json['instructor_code'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      youtubeUrl: json['youtube_url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String?,
      status: CourseStatus.fromString(json['status'] as String),
      rejectionReason: json['rejection_reason'] as String?,
      learningPoints: (json['learning_points'] as List?)?.cast<String>() ?? [],
      requirements: (json['requirements'] as List?)?.cast<String>() ?? [],
      totalViews: json['total_views'] ?? 0,
      averageRating: (json['average_rating'] as num?)?.toDouble() ?? 0.0,
      totalRatings: json['total_ratings'] ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toInsertJson() {
    return {
      'instructor_code': instructorCode,
      'title': title,
      'description': description,
      'category': category,
      'youtube_url': youtubeUrl,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      'status': status.value,
      if (rejectionReason != null) 'rejection_reason': rejectionReason,
      if (learningPoints.isNotEmpty) 'learning_points': learningPoints,
      if (requirements.isNotEmpty) 'requirements': requirements,
    };
  }

  Map<String, dynamic> toUpdateJson() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'youtube_url': youtubeUrl,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      'status': status.value,
      if (rejectionReason != null) 'rejection_reason': rejectionReason,
      if (learningPoints.isNotEmpty) 'learning_points': learningPoints,
      if (requirements.isNotEmpty) 'requirements': requirements,
    };
  }

  factory CourseModel.newDraft() {
    return CourseModel(
      id: '',
      instructorCode: 0,
      title: '',
      description: '',
      category: '',
      youtubeUrl: '',
      status: CourseStatus.draft,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      learningPoints: [],
      requirements: [],
    );
  }

  CourseModel copyWith({
    final String? id,
    final int? instructorCode,
    final String? title,
    final String? description,
    final String? category,
    final String? youtubeUrl,
    final String? thumbnailUrl,
    final CourseStatus? status,
    final String? rejectionReason,
    final List<String>? learningPoints,
    final List<String>? requirements,
    final int? totalViews,
    final double? averageRating,
    final int? totalRatings,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) {
    return CourseModel(
      id: id ?? this.id,
      instructorCode: instructorCode ?? this.instructorCode,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      youtubeUrl: youtubeUrl ?? this.youtubeUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      status: status ?? this.status,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      learningPoints: learningPoints ?? this.learningPoints,
      requirements: requirements ?? this.requirements,
      totalViews: totalViews ?? this.totalViews,
      averageRating: averageRating ?? this.averageRating,
      totalRatings: totalRatings ?? this.totalRatings,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
