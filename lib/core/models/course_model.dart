class CourseModel {
  final String id;
  final String instructorId;

  // Instructor details (joined from users table)
  final String instructorName;
  final String? instructorBio;
  final String? instructorAvatar;

  // Course basic info
  final String title;
  final String description;
  final String category;

  // Media
  final String youtubeUrl;
  final String? thumbnailUrl;

  // Status & Approval
  final CourseStatus status;
  final String? rejectionReason;

  // Course details
  final List<String> learningPoints;
  final List<String> requirements;

  // Stats
  final int totalViews;
  final double averageRating;
  final int totalRatings;

  // Timestamps
  final DateTime createdAt;
  final DateTime updatedAt;

  // Additional fields for student view (optional, from joins)
  final bool? hasViewed;
  final bool? isCompleted;
  final int? userRating;
  final String? userReview;

  const CourseModel({
    required this.id,
    required this.instructorId,
    required this.instructorName,
    this.instructorBio,
    this.instructorAvatar,
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
    this.hasViewed,
    this.isCompleted,
    this.userRating,
    this.userReview,
  });

  factory CourseModel.fromJson(final Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as String,
      instructorId: json['instructor_id'].toString(),
      instructorName:
          json['instructor_name'] as String? ?? 'Unknown Instructor',
      instructorBio: json['instructor_bio'] as String?,
      instructorAvatar: json['instructor_avatar'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      youtubeUrl: json['youtube_url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String?,
      status: CourseStatus.fromString(json['status'] as String),
      rejectionReason: json['rejection_reason'] as String?,
      learningPoints:
          (json['learning_points'] as List<dynamic>?)
              ?.map((final e) => e.toString())
              .toList() ??
          [],
      requirements:
          (json['requirements'] as List<dynamic>?)
              ?.map((final e) => e.toString())
              .toList() ??
          [],
      totalViews: json['total_views'] as int? ?? 0,
      averageRating: (json['average_rating'] as num?)?.toDouble() ?? 0.0,
      totalRatings: json['total_ratings'] as int? ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      hasViewed: json['has_viewed'] as bool?,
      isCompleted: json['is_completed'] as bool?,
      userRating: json['user_rating'] as int?,
      userReview: json['user_review'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'instructor_id': instructorId,
      'title': title,
      'description': description,
      'category': category,
      'youtube_url': youtubeUrl,
      'thumbnail_url': thumbnailUrl,
      'status': status.value,
      'rejection_reason': rejectionReason,
      'learning_points': learningPoints,
      'requirements': requirements,
      'total_views': totalViews,
      'average_rating': averageRating,
      'total_ratings': totalRatings,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Map<String, dynamic> toJsonForInsert() {
    return {
      'instructor_id': instructorId,
      'title': title,
      'description': description,
      'category': category,
      'youtube_url': youtubeUrl,
      'thumbnail_url': thumbnailUrl,
      'status': status.value,
      'learning_points': learningPoints,
      'requirements': requirements,
    };
  }

  CourseModel copyWith({
    final String? id,
    final String? instructorId,
    final String? instructorName,
    final String? instructorBio,
    final String? instructorAvatar,
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
    final bool? hasViewed,
    final bool? isCompleted,
    final int? userRating,
    final String? userReview,
  }) {
    return CourseModel(
      id: id ?? this.id,
      instructorId: instructorId ?? this.instructorId,
      instructorName: instructorName ?? this.instructorName,
      instructorBio: instructorBio ?? this.instructorBio,
      instructorAvatar: instructorAvatar ?? this.instructorAvatar,
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
      hasViewed: hasViewed ?? this.hasViewed,
      isCompleted: isCompleted ?? this.isCompleted,
      userRating: userRating ?? this.userRating,
      userReview: userReview ?? this.userReview,
    );
  }

  factory CourseModel.newDraft() => CourseModel(
    id: '',
    instructorId: '',
    instructorName: '',
    title: '',
    description: '',
    category: '',
    youtubeUrl: '',
    status: CourseStatus.draft,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  bool get isDraft => status == CourseStatus.draft;
  bool get isPending => status == CourseStatus.pending;
  bool get isApproved => status == CourseStatus.approved;
  bool get isRejected => status == CourseStatus.rejected;

  String get formattedRating => averageRating.toStringAsFixed(1);
  String get viewsCount => totalViews > 1000
      ? '${(totalViews / 1000).toStringAsFixed(1)}K'
      : totalViews.toString();
}

enum CourseStatus {
  draft('draft'),
  pending('pending'),
  approved('approved'),
  rejected('rejected');

  final String value;
  const CourseStatus(this.value);

  static CourseStatus fromString(final String value) {
    return CourseStatus.values.firstWhere(
      (final status) => status.value == value.toLowerCase(),
      orElse: () => CourseStatus.draft,
    );
  }

  String get displayName {
    switch (this) {
      case CourseStatus.draft:
        return 'Draft';
      case CourseStatus.pending:
        return 'Pending Review';
      case CourseStatus.approved:
        return 'Approved';
      case CourseStatus.rejected:
        return 'Rejected';
    }
  }
}
