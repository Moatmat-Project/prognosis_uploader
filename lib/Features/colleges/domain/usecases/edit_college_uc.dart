import 'package:dartz/dartz.dart';
import 'package:moatmat_uploader/Core/errors/exceptions.dart';
import 'package:moatmat_uploader/Core/usecase/usecase.dart';
import 'package:moatmat_uploader/Features/colleges/domain/entities/college.dart';
import 'package:moatmat_uploader/Features/colleges/domain/repository/college_repository.dart';

class EditCollegeUC implements UseCase<void, College> {
  final CollegeRepository repository;

  EditCollegeUC(this.repository);

  @override
  Future<Either<Failure, void>> call(College college) async {
    return await repository.editCollege(college);
  }
}
