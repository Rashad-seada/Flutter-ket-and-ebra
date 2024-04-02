class AppConsts {

  //----- translation -----
  static const String localPath = "assets/translations";

  //----- base url -----
  static const String url = "http://dev1ebtkar-001-site20.atempurl.com/api";
  static const String imgUrl = "http://dev1ebtkar-001-site20.atempurl.com";
  //----- auth end points -----
  static const String registerSellerEndPoint = "/Auth/registerSeller";
  static const String registerBuyerEndPoint = "/Auth/registerCustomer";
  static const String loginEndPoint = "/Auth/SginIn";
  static const String resetPasswordEndPoint = "/Auth/ResetPassword";

  //----- variation end points -----
  static const String getButtonEndPoint = "/ItemClothes/GetButtonsBySeller";
  static const String getChestEndPoint = "/ItemClothes/GetChestBySeller";
  static const String getCollarEndPoint = "/ItemClothes/GetYakaBySeller";
  static const String getEmbroideryEndPoint = "/ItemClothes/GetEmbroideryBySeller";
  static const String getFabricEndPoint = "/ItemClothes/GetTextureBySeller";
  static const String getFrontPocketEndPoint = "/ItemClothes/GetFrontPocketBySeller";
  static const String getSleeveEndPoint = "/ItemClothes/GetHandBySeller";


  static const String createEmbroideryEndPoint = "/ItemClothes/CreateEmbroidery";
  static const String createCollarEndPoint = "/ItemClothes/CreateYaka";
  static const String createButtonEndPoint = "/ItemClothes/CreateButtons";
  static const String createChestEndPoint = "/ItemClothes/CreateChest";
  static const String createFabricEndPoint = "/ItemClothes/CreateTexture";
  static const String createFrontPocketEndPoint = "/ItemClothes/CreateFrontPocket";
  static const String createSleeveEndPoint = "/ItemClothes/CreateHand";

  //----- sellers end points -----
  static const String getAllSellersEndPoint = "/Users/GetAllSeller";
  static const String getSellersByLocationIdEndPoint = "/Users/GetSellersBycityId";

  //----- cart end points -----
  static const String addToCartEndPoint = "/Cart/AddtoCart";
  static const String getCartEndPoint = "/Cart/GetCart";
  static const String updateCartItemEndPoint = "/Cart/UpdateCart";
  static const String removeCartItemEndPoint = "/Cart/RemoveCart";

  //----- Admin ------
  static const String getHomeEndPoint = "/Admin/GetHomeData";
  static const String setHomeAdEndPoint = "/Admin/SetHomeAds";

  //----- Order ------
  static const String createOrderEndPoint = "/ItemOrder/CreateOrder";
  static const String getAllOrdersEndPoint = "/ItemOrder/GetAllUserOrder";


  //----- shared pref -----
  static const String boxName = "USER_BOX";
  static const String userKey = "USER_KEY";

}