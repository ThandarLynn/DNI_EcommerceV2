import 'package:dni_ecommerce_v2/api/app_api_service.dart';
import 'package:dni_ecommerce_v2/db/category_map_dao.dart';
import 'package:dni_ecommerce_v2/db/cateogry_dao.dart';
import 'package:dni_ecommerce_v2/db/user_dao.dart';
import 'package:dni_ecommerce_v2/repository/category_repository.dart';
import 'package:dni_ecommerce_v2/repository/user_repository.dart';
import 'package:dni_ecommerce_v2/viewobject/common/ps_value_holder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../db/common/ps_shared_preferences.dart';


List<SingleChildWidget> providers = <SingleChildWidget>[
  ...independentProviders,
  ..._dependentProviders,
  ..._valueProviders,
];

List<SingleChildWidget> independentProviders = <SingleChildWidget>[
  Provider<AppSharedPreferencess>.value(value: AppSharedPreferencess.instance),
  Provider<AppApiService>.value(value: AppApiService()),
  Provider<CategoryDao>.value(value: CategoryDao()),
  Provider<CategoryMapDao>.value(value: CategoryMapDao.instance),
  // Provider<ProductDao>.value(
  //     value: ProductDao.instance), //correct type with instance
  // Provider<ProductMapDao>.value(value: ProductMapDao.instance),
  // Provider<AboutAppDao>.value(value: AboutAppDao.instance),
  // Provider<NotiDao>.value(value: NotiDao.instance),
  // Provider<ProductCollectionDao>.value(value: ProductCollectionDao.instance),
  // Provider<ShopInfoDao>.value(value: ShopInfoDao.instance),
  // Provider<BlogDao>.value(value: BlogDao.instance),
  // Provider<TransactionHeaderDao>.value(value: TransactionHeaderDao.instance),
  // Provider<TransactionDetailDao>.value(value: TransactionDetailDao.instance),
  Provider<UserDao>.value(value: UserDao.instance),
  // Provider<UserLoginDao>.value(value: UserLoginDao.instance),
  // Provider<RelatedProductDao>.value(value: RelatedProductDao.instance),
  // Provider<CommentHeaderDao>.value(value: CommentHeaderDao.instance),
  // Provider<CommentDetailDao>.value(value: CommentDetailDao.instance),
  // Provider<RatingDao>.value(value: RatingDao.instance),
  // Provider<ShippingCountryDao>.value(value: ShippingCountryDao.instance),
  // Provider<ShippingCityDao>.value(value: ShippingCityDao.instance),
  // Provider<HistoryDao>.value(value: HistoryDao.instance),
  // Provider<GalleryDao>.value(value: GalleryDao.instance),
  // Provider<ShippingMethodDao>.value(value: ShippingMethodDao.instance),
  // Provider<BasketDao>.value(value: BasketDao.instance),
  // Provider<FavouriteProductDao>.value(value: FavouriteProductDao.instance),
];

List<SingleChildWidget> _dependentProviders = <SingleChildWidget>[
  // ProxyProvider<AppSharedPreferences, AppThemeRepository>(
  //   update: (_, AppSharedPreferences ssSharedPreferences,
  //           AppThemeRepository psThemeRepository) =>
  //       AppThemeRepository(psSharedPreferences: ssSharedPreferences),
  // ),
  // ProxyProvider<AppApiService, AppInfoRepository>(
  //   update:
  //       (_, AppApiService psApiService, AppInfoRepository appInfoRepository) =>
  //           AppInfoRepository(psApiService: psApiService),
  // ),
  // ProxyProvider<AppSharedPreferences, LanguageRepository>(
  //   update: (_, AppSharedPreferences ssSharedPreferences,
  //           LanguageRepository languageRepository) =>
  //       LanguageRepository(psSharedPreferences: ssSharedPreferences),
  // ),
  ProxyProvider2<AppApiService, CategoryDao, CategoryRepository>(
    update: (_, AppApiService psApiService, CategoryDao categoryDao,
            CategoryRepository? categoryRepository2) =>
        CategoryRepository(
            psApiService: psApiService, categoryDao: categoryDao),
  ),
  // ProxyProvider2<AppApiService, SubCategoryDao, SubCategoryRepository>(
  //   update: (_, AppApiService psApiService, SubCategoryDao subCategoryDao,
  //           SubCategoryRepository subCategoryRepository) =>
  //       SubCategoryRepository(
  //           psApiService: psApiService, subCategoryDao: subCategoryDao),
  // ),
  // ProxyProvider2<AppApiService, AboutAppDao, AboutAppRepository>(
  //   update: (_, AppApiService psApiService, AboutAppDao aboutUsDao,
  //           AboutAppRepository aboutUsRepository) =>
  //       AboutAppRepository(psApiService: psApiService, aboutUsDao: aboutUsDao),
  // ),
  // ProxyProvider2<AppApiService, ProductCollectionDao,
  //     ProductCollectionRepository>(
  //   update: (_,
  //           AppApiService psApiService,
  //           ProductCollectionDao productCollectionDao,
  //           ProductCollectionRepository productCollectionRepository) =>
  //       ProductCollectionRepository(
  //           psApiService: psApiService,
  //           productCollectionDao: productCollectionDao),
  // ),
  // ProxyProvider2<AppApiService, ProductDao, ProductRepository>(
  //   update: (_, AppApiService psApiService, ProductDao productDao,
  //           ProductRepository? categoryRepository2) =>
  //       ProductRepository(psApiService: psApiService, productDao: productDao),
  // ),
  // ProxyProvider2<AppApiService, NotiDao, NotiRepository>(
  //   update: (_, AppApiService psApiService, NotiDao notiDao,
  //           NotiRepository notiRepository) =>
  //       NotiRepository(psApiService: psApiService, notiDao: notiDao),
  // ),
  // ProxyProvider2<AppApiService, ShopInfoDao, ShopInfoRepository>(
  //   update: (_, AppApiService psApiService, ShopInfoDao shopInfoDao,
  //           ShopInfoRepository shopInfoRepository) =>
  //       ShopInfoRepository(
  //           psApiService: psApiService, shopInfoDao: shopInfoDao),
  // ),
  // ProxyProvider<AppApiService, NotificationRepository>(
  //   update:
  //       (_, AppApiService psApiService, NotificationRepository notificationRepository) =>
  //           NotificationRepository(
  //     psApiService: psApiService,
  //   ),
  // ),
  ProxyProvider2<AppApiService, UserDao, UserRepository>(
    update: (_, AppApiService psApiService, UserDao userDao,
            UserRepository? userRepository) =>
        UserRepository(psApiService: psApiService, userDao: userDao),
  ),
  // ProxyProvider<AppApiService, ClearAllDataRepository>(
  //   update: (_, AppApiService psApiService,
  //           ClearAllDataRepository clearAllDataRepository) =>
  //       ClearAllDataRepository(),
  // ),
  // ProxyProvider<AppApiService, DeleteTaskRepository>(
  //   update: (_, AppApiService psApiService,
  //           DeleteTaskRepository deleteTaskRepository) =>
  //       DeleteTaskRepository(),
  // ),
  // ProxyProvider2<AppApiService, BlogDao, BlogRepository>(
  //   update: (_, AppApiService psApiService, BlogDao blogDao,
  //           BlogRepository blogRepository) =>
  //       BlogRepository(psApiService: psApiService, blogDao: blogDao),
  // ),
  // ProxyProvider2<AppApiService, TransactionHeaderDao,
  //     TransactionHeaderRepository>(
  //   update: (_,
  //           AppApiService psApiService,
  //           TransactionHeaderDao transactionHeaderDao,
  //           TransactionHeaderRepository? transactionRepository) =>
  //       TransactionHeaderRepository(
  //           psApiService: psApiService,
  //           transactionHeaderDao: transactionHeaderDao),
  // ),
  // ProxyProvider2<AppApiService, TransactionDetailDao,
  //     TransactionDetailRepository>(
  //   update: (_,
  //           AppApiService psApiService,
  //           TransactionDetailDao transactionDetailDao,
  //           TransactionDetailRepository? transactionDetailRepository) =>
  //       TransactionDetailRepository(
  //           psApiService: psApiService,
  //           transactionDetailDao: transactionDetailDao),
  // ),
  // ProxyProvider2<AppApiService, CommentHeaderDao, CommentHeaderRepository>(
  //   update: (_, AppApiService psApiService, CommentHeaderDao commentHeaderDao,
  //           CommentHeaderRepository commentHeaderRepository) =>
  //       CommentHeaderRepository(
  //           psApiService: psApiService, commentHeaderDao: commentHeaderDao),
  // ),
  // ProxyProvider2<AppApiService, CommentDetailDao, CommentDetailRepository>(
  //   update: (_, AppApiService psApiService, CommentDetailDao commentDetailDao,
  //           CommentDetailRepository commentHeaderRepository) =>
  //       CommentDetailRepository(
  //           psApiService: psApiService, commentDetailDao: commentDetailDao),
  // ),
  // ProxyProvider2<AppApiService, RatingDao, RatingRepository>(
  //   update: (_, AppApiService psApiService, RatingDao ratingDao,
  //           RatingRepository ratingRepository) =>
  //       RatingRepository(psApiService: psApiService, ratingDao: ratingDao),
  // ),
  // ProxyProvider2<AppApiService, HistoryDao, HistoryRepository>(
  //   update: (_, AppApiService psApiService, HistoryDao historyDao,
  //           HistoryRepository? historyRepository) =>
  //       HistoryRepository(historyDao: historyDao),
  // ),
  // ProxyProvider2<AppApiService, GalleryDao, GalleryRepository>(
  //   update: (_, AppApiService psApiService, GalleryDao galleryDao,
  //           GalleryRepository galleryRepository) =>
  //       GalleryRepository(galleryDao: galleryDao, psApiService: psApiService),
  // ),
  // ProxyProvider<AppApiService, ContactUsRepository>(
  //   update: (_, AppApiService psApiService,
  //           ContactUsRepository? apiStatusRepository) =>
  //       ContactUsRepository(psApiService: psApiService),
  // ),
  // ProxyProvider<AppApiService, ShippingCostRepository>(
  //   update: (_, AppApiService psApiService,
  //           ShippingCostRepository apiStatusRepository) =>
  //       ShippingCostRepository(psApiService: psApiService),
  // ),
  // ProxyProvider2<AppApiService, BasketDao, BasketRepository>(
  //   update: (_, AppApiService psApiService, BasketDao basketDao,
  //           BasketRepository? historyRepository) =>
  //       BasketRepository(basketDao: basketDao),
  // ),
  // ProxyProvider2<AppApiService, ShippingMethodDao, ShippingMethodRepository>(
  //   update: (_, AppApiService psApiService, ShippingMethodDao shippingMethodDao,
  //           ShippingMethodRepository shippingMethodRepository) =>
  //       ShippingMethodRepository(
  //           psApiService: psApiService, shippingMethodDao: shippingMethodDao),
  // ),
  // ProxyProvider2<AppApiService, ShippingCountryDao, ShippingCountryRepository>(
  //   update: (_,
  //           AppApiService psApiService,
  //           ShippingCountryDao shippingCountryDao,
  //           ShippingCountryRepository? shippingCountryRepository) =>
  //       ShippingCountryRepository(
  //           shippingCountryDao: shippingCountryDao, psApiService: psApiService),
  // ),
  // ProxyProvider2<AppApiService, ShippingCityDao, ShippingCityRepository>(
  //   update: (_, AppApiService psApiService, ShippingCityDao shippingCityDao,
  //           ShippingCityRepository? shippingCityRepository) =>
  //       ShippingCityRepository(
  //           shippingCityDao: shippingCityDao, psApiService: psApiService),
  // ),
  // ProxyProvider<AppApiService, CouponDiscountRepository>(
  //   update: (_, AppApiService psApiService,
  //           CouponDiscountRepository? couponDiscountRepository) =>
  //       CouponDiscountRepository(psApiService: psApiService),
  // ),
  // ProxyProvider<AppApiService, TokenRepository>(
  //   update: (_, AppApiService psApiService, TokenRepository? tokenRepository) =>
  //       TokenRepository(psApiService: psApiService),
  // ),
];

List<SingleChildWidget> _valueProviders = <SingleChildWidget>[
  StreamProvider<AppValueHolder>(
    initialData: AppValueHolder(),
    create: (BuildContext context) =>
        Provider.of<AppSharedPreferencess>(context, listen: false)
            .psValueHolder,
  )
];
