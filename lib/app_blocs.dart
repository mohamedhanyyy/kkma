import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/auth/cubit/login_cubit.dart';
import 'modules/auth/cubit/send_otp_cubit.dart';
import 'modules/repository/cubit/category_details_cubit.dart';
import 'modules/repository/cubit/store_item_cubit.dart';
import 'modules/repository/cubit/stores_cubit.dart';

final appBlocs = [
  BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
  BlocProvider<StoresCubit>(create: (context) => StoresCubit()),
  BlocProvider<SendOtpCubit>(create: (context) => SendOtpCubit()),
  BlocProvider<StoreItemCubit>(create: (context) => StoreItemCubit()),
  BlocProvider<CategoryDetailsCubit>(
      create: (context) => CategoryDetailsCubit()),
];
