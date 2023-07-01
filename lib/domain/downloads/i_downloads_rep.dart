import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

import '../core/failures/mian_failure.dart';

abstract class IDownloadsRepo {
  Future<Either<MinFailure, List<Downloads>>> getDownloadsImage();
}
