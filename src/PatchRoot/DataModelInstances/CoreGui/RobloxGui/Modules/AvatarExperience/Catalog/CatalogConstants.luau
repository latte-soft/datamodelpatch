local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local v2 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local v3 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local v5 = {
    MinSecsToRefreshRecommendedCatalogPage = 60, 
    MaxTopics = game:DefineFastInt("LuaMaxCatalogTopics", 20), 
    MaxItemsInTopicsRequest = game:DefineFastInt("LuaMaxItemsInTopicsRequest", 10), 
    CreatorType = {
        Group = "Group", 
        User = "User"
    }, 
    PageFetchLimit = 30, 
    ItemDetailsKey = "luaapp.itemapi.itemDetails.", 
    BatchItemDetailsKey = "luaapp.itemapi.batchItemDetails.", 
    BundlesInfoKey = "luaapp.itemapi.bundlesinfo.", 
    BuyButtonInfoKey = "catalog.getispurchasable.", 
    BuyButtonAssetInfoKey = "catalog.getispurchasable.", 
    PurchaseProductKey = "catalog.purchaseproduct.", 
    RedeemQRCodeItemKey = "catalog.redeemqrcodeitem.", 
    RecommendedItemsForAssetsKey = "catalog.getrecommendeditemsforassets.", 
    RecommendedItemsForBundlesKey = "catalog.getrecommendeditemsforbundles.", 
    GetFavoriteBundleKey = "catalog.getFavoriteBundle", 
    GetFavoriteAssetKey = "catalog.getFavoriteAsset", 
    SetFavoriteBundleKey = "catalog.setFavoriteBundle", 
    SetFavoriteAssetKey = "catalog.setFavoriteAsset", 
    GetItemOwnershipStatus = "catalog.getItemOwnershipStatus", 
    GetSellPageDataKey = "catalog.getSellPageData", 
    RemoveCurrentlySellingAssetKey = "catalog.removeCurrentlySellingAsset", 
    RemoveAvailableToSellAssetKey = "catalog.removeAvailableToSellAsset", 
    GetResellersKey = "catalog.getResellersKey", 
    GetAssetResalesDataKey = "catalog.getAssetResalesDataKey", 
    GetMarketplaceFeeKey = "catalog.getMarketplaceFeeKey", 
    GetCollectibleMarketplaceResaleParametersKey = "catalog.getCollectibleMarketplaceResaleParametersKey", 
    FetchBundleInfoKey = "catalog.itemapi.bundlesinfo.", 
    FetchOutfitInfoFromBundleKey = "catalog.fetchOutfitInfoFromBundleKey", 
    SponsoredItemsDataKey = "catalog.sponsored-items.details", 
    GetTopicsKey = "catalog.topics.", 
    FetchCollectibleResaleDataKey = "catalog.fetchCollectibleResaleData.", 
    FetchCollectibleResellableInstancesKey = "catalog.fetchCollectibleResellableInstances", 
    UpdateCollectibleInstanceResaleStateKey = "catalog.updateCollectibleInstanceResaleState", 
    FetchLookDetailInfoKey = "catalog.fetchLookDetailInfo", 
    FetchWidgetInfoKey = if not require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixNoItemsFoundWidgetsResults)() then nil else "catalog.fetchWidgetInfo", 
    FetchAssetVersionDataKey = "develop.assets.savedVersions", 
    ExpectedCurrencyRobux = 1, 
    PriceStatus = {
        Free = "Free", 
        Offsale = "OffSale", 
        NoResellers = "NoResellers"
    }, 
    PurchaseStatus = {
        Owned = 1, 
        Purchasable = 2, 
        NotPurchasable = 3
    }, 
    ActionBar = {
        ActionBarPadding = 24, 
        ActionBarHeight = 44, 
        ActionBarPremiumHeight = 54, 
        ActionBarPremiumOnlyHeight = 68, 
        ActionBarGradientHeight = 40, 
        DisabledButtonTransparency = 0.5, 
        SimilarItemsSmallTileSize = 90, 
        SimilarItemsLargeTileSize = 110, 
        SimilarItemsGridVerticalPadding = 10, 
        SimilarItemsGridHorizontalPadding = 10
    }, 
    PremiumIconPadding = 4, 
    LargeCardWidth = 148, 
    MediumCardWidth = 100, 
    bundleIncludedItemsCount = 6, 
    SponsoredItemsToFetch = 10, 
    SponsoredItemsCategoryRecommended = "Recommended", 
    ItemRestrictions = {
        Limited = "Limited", 
        LimitedUnique = "LimitedUnique", 
        Collectible = "Collectible"
    }, 
    ItemRestrictionsLocale = {
        Limited = "Feature.Catalog.Label.Limited", 
        LimitedUnique = "Feature.Catalog.Label.LimitedU", 
        Unlimited = "Feature.Catalog.Label.Unlimited", 
        Collectible = "Feature.Catalog.LabelCollectibles"
    }, 
    ItemStatus = {
        New = "New", 
        Sale = "Sale"
    }, 
    ItemStatusLocale = {
        New = "Feature.Catalog.Label.New", 
        Sale = "Feature.Catalog.Label.Sale"
    }, 
    ResaleRestriction = {
        Invalid = 0, 
        None = 1, 
        Disabled = 2
    }, 
    MaxOwnedCopiesPerPage = 100, 
    MaxResellersPerPage = 10, 
    AnalyticsContext = {
        Catalog = "Catalog", 
        AvatarEditorRecommendedItem = "AvatarEditorRecommendedItem", 
        ItemDetailsRecommendedItem = "ItemDetailsRecommendedItem", 
        CatalogSearch = "CatalogSearch", 
        CatalogSort = "CatalogSort", 
        ProfileItemDetails = "ProfileItemDetails", 
        CatalogReseller = "CatalogReseller", 
        CatalogItemDetails = "CatalogItemDetails", 
        AvatarShop = "avatarShop"
    }, 
    CategoryFilters = {
        Featured = Enum.CatalogCategoryFilter.Featured, 
        Collectibles = Enum.CatalogCategoryFilter.Collectibles, 
        CommunityCreations = Enum.CatalogCategoryFilter.CommunityCreations, 
        Premium = Enum.CatalogCategoryFilter.Premium, 
        Recommended = Enum.CatalogCategoryFilter.Recommended
    }, 
    Filters = {
        "Characters", 
        "Body", 
        "Clothing", 
        "Accessories", 
        "Animation", 
        "Emotes"
    }, 
    FilterLabels = {
        Characters = "Feature.Catalog.Label.Characters", 
        Body = "Feature.Catalog.Label.Body", 
        Clothing = "Feature.Catalog.Label.Clothing", 
        Accessories = "Feature.Catalog.LabelAccessories", 
        Animation = "Feature.Catalog.Label.Animation", 
        Emotes = "Feature.Catalog.Label.Emotes"
    }, 
    SortTypeLocalization = {
        Relevance = "Feature.Catalog.Label.Relevance", 
        Bestselling = "Feature.Catalog.Label.Bestselling", 
        PriceLowToHigh = "Feature.Catalog.Label.PriceLowToHigh", 
        PriceHighToLow = "Feature.Catalog.Label.PriceHighToLow", 
        MostFavorited = "Feature.Catalog.Label.MostFavorited", 
        RecentlyCreated = "Feature.Catalog.Label.RecentlyCreated"
    }, 
    SortTypeAPIMap = {
        Relevance = "Relevance", 
        Bestselling = "Sales", 
        PriceLowToHigh = "PriceAsc", 
        PriceHighToLow = "PriceDesc", 
        MostFavorited = "Favorited", 
        RecentlyCreated = "Created"
    }, 
    SaleLocationType = {
        Invalid = "Invalid", 
        ShopOnly = "ShopOnly", 
        MyExperiencesOnly = "MyExperiencesOnly", 
        ShopAndMyExperiences = "ShopAndMyExperiences", 
        ExperiencesById = "ExperiencesById", 
        ShopAndAllExperiences = "ShopAndAllExperiences", 
        ExperiencesDevApiOnly = "ExperiencesDevApiOnly"
    }, 
    MinPriceFilter = 0, 
    MaxPriceFilter = 2147483647, 
    PurchaseErrorReason = {
        TwoStepVerificationRequired = "TwoStepVerificationRequired"
    }, 
    RobloxEmoji = {
        VerifiedBadge = utf8.char(57344), 
        Premium = utf8.char(57345), 
        Robux = utf8.char(57346)
    }, 
    ReportScreen = {
        Contexts = {
            Experience = "experience", 
            Profile = "profile", 
            Item = "item"
        }, 
        Platforms = {
            Console = "console", 
            VR = "vr"
        }
    }
};
v5.DefaultFilters = {
    PriceRange = {
        minPrice = v5.MinPriceFilter, 
        maxPrice = v5.MaxPriceFilter
    }, 
    SalesTypeFilter = v1.All, 
    CreatorFilter = "", 
    UnavailableItemFilter = v2.Hide, 
    SelectedTopics = {}, 
    CatalogSort = v3.Relevance, 
    CatalogSortAggregation = v4.AllTime
};
return v5;
