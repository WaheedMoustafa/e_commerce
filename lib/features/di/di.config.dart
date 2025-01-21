// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../core/shared_pref_utils.dart' as _i599;
import '../base/base_api_state.dart' as _i49;
import '../data/repositories/auth/auth_repository_impl.dart' as _i27;
import '../data/repositories/auth/data_source/auth_remote_ds.dart' as _i778;
import '../data/repositories/auth/data_source/auth_remote_ds_impl.dart'
    as _i1018;
import '../data/repositories/cart/cart_ds/cart_repository_ds.dart' as _i283;
import '../data/repositories/cart/cart_ds/cart_repository_ds_impl.dart'
    as _i815;
import '../data/repositories/cart/cart_repository_impl.dart' as _i89;
import '../data/repositories/home/home_data_source/home_remote_ds.dart'
    as _i1061;
import '../data/repositories/home/home_data_source/home_remote_ds_impl.dart'
    as _i1021;
import '../data/repositories/home/home_repo_impl.dart' as _i120;
import '../domain/mappers/cart_mapper.dart' as _i740;
import '../domain/mappers/category_mapper.dart' as _i34;
import '../domain/mappers/product_mapper.dart' as _i437;
import '../domain/models/category.dart' as _i347;
import '../domain/repositories/auth_repository.dart' as _i800;
import '../domain/repositories/cart_repository.dart' as _i463;
import '../domain/repositories/home_repo/home_repo.dart' as _i879;
import '../domain/usecase/get_categories_usecase.dart' as _i208;
import '../domain/usecase/get_product_by_category_use_case.dart' as _i212;
import '../domain/usecase/get_products_usecase.dart' as _i832;
import '../domain/usecase/get_sub_categories_on_category_usecase.dart' as _i92;
import '../presentation/screens/auth/sign_in/cubit/sign_in_cubit.dart' as _i706;
import '../presentation/screens/auth/sign_up/cubit/sign_up_cubit.dart' as _i289;
import '../presentation/screens/tabs/cart/cubit/cart_cubit.dart' as _i864;
import '../presentation/screens/tabs/categories/cubit/product_list_cubit.dart'
    as _i870;
import '../presentation/screens/tabs/categories/cubit/product_list_cubit_state.dart'
    as _i388;
import '../presentation/screens/tabs/home_tab/cubit/home_cubit.dart' as _i403;
import '../presentation/screens/tabs/home_tab/cubit/home_cubit_state.dart'
    as _i368;
import 'module/network_module.dart' as _i881;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i599.SharedPrefUtils>(() => _i599.SharedPrefUtils());
    gh.factory<_i34.CategoryMapper>(() => _i34.CategoryMapper());
    gh.singleton<_i973.InternetConnectionChecker>(
        () => networkModule.getInternetConnectionChecker());
    gh.singleton<_i361.Dio>(() => networkModule.getDio());
    gh.factory<_i368.HomeCubitState>(() => _i368.HomeCubitState(
          selectedCategory: gh<_i347.Category>(),
          categoriesApiState: gh<_i49.BaseApiState>(),
          productsApiState: gh<_i49.BaseApiState>(),
          subCategoriesApiState: gh<_i49.BaseApiState>(),
        ));
    gh.factory<_i283.CartRepositoryDs>(
        () => _i815.CartRepositoryDsImpl(gh<_i361.Dio>()));
    gh.factory<_i388.ProductListCubitState>(() => _i388.ProductListCubitState(
        productListApiState: gh<_i49.BaseApiState>()));
    gh.factory<_i778.AuthRemoteDs>(() => _i1018.AuthRemoteDsImpl(
          gh<_i361.Dio>(),
          gh<_i599.SharedPrefUtils>(),
        ));
    gh.factory<_i1061.HomeRemoteDs>(
        () => _i1021.HomeRemoteDsImpl(gh<_i361.Dio>()));
    gh.factory<_i740.CartMapper>(
        () => _i740.CartMapper(gh<_i34.CategoryMapper>()));
    gh.factory<_i437.ProductMapper>(
        () => _i437.ProductMapper(gh<_i34.CategoryMapper>()));
    gh.factory<_i463.CartRepository>(() => _i89.CartRepositoryImpl(
          gh<_i740.CartMapper>(),
          gh<_i283.CartRepositoryDs>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i800.AuthRepository>(() => _i27.AuthRepositoryImpl(
          gh<_i778.AuthRemoteDs>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i879.HomeRepo>(() => _i120.HomeRepoImpl(
          gh<_i1061.HomeRemoteDs>(),
          gh<_i973.InternetConnectionChecker>(),
          gh<_i34.CategoryMapper>(),
          gh<_i437.ProductMapper>(),
        ));
    gh.factory<_i864.CartCubit>(
        () => _i864.CartCubit(gh<_i463.CartRepository>()));
    gh.factory<_i706.SignInCubit>(
        () => _i706.SignInCubit(gh<_i800.AuthRepository>()));
    gh.factory<_i289.SignUpCubit>(
        () => _i289.SignUpCubit(gh<_i800.AuthRepository>()));
    gh.factory<_i208.GetCategoriesUseCase>(
        () => _i208.GetCategoriesUseCase(gh<_i879.HomeRepo>()));
    gh.factory<_i832.GetProductsUseCase>(
        () => _i832.GetProductsUseCase(gh<_i879.HomeRepo>()));
    gh.factory<_i212.GetProductByCategoryUseCase>(
        () => _i212.GetProductByCategoryUseCase(gh<_i879.HomeRepo>()));
    gh.factory<_i92.GetSubCategoriesUseCase>(
        () => _i92.GetSubCategoriesUseCase(gh<_i879.HomeRepo>()));
    gh.factory<_i403.HomeCubit>(() => _i403.HomeCubit(
          gh<_i208.GetCategoriesUseCase>(),
          gh<_i832.GetProductsUseCase>(),
          gh<_i92.GetSubCategoriesUseCase>(),
        ));
    gh.factory<_i870.ProductListCubit>(
        () => _i870.ProductListCubit(gh<_i212.GetProductByCategoryUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i881.NetworkModule {}
