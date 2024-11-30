import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/managers/asset_manager.dart';
import '../../model/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);
  final onboardingItems = [
    OnboardingModel(
      image: AssetsManager.onboarding1,
      title: 'View and searching for medicines.',
      subtitle: 'Here,you can easily search for the medicines you need and find nearby pharmacies that have them quickly and conveniently.',
    ),
    OnboardingModel(
      image: AssetsManager.onboarding2,
      title: 'Own a pharmacy?',
      subtitle: 'Now you can add the available medicines you have,so users can find and purchase them easily.',
    ),

  ];

}
