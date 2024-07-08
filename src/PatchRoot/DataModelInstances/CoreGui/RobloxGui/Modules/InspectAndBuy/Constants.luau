local v0 = {
    NotificationKeys = {
        MultipleBundleNoticeKey = "InGame.InspectMenu.Description.MultipleBundlesNotice", 
        SingleBundleNoticeKey = "InGame.InspectMenu.Description.SingleBundleNotice", 
        LimitedItemNoticeKey = "InGame.InspectMenu.Description.LimitedNotice", 
        LayeredClothingOnR6Key = "InGame.InspectMenu.Description.LayeredClothingR6"
    }, 
    ItemType = {
        Asset = "Asset", 
        Bundle = "Bundle"
    }, 
    View = {
        Compact = 0, 
        Wide = 1, 
        WideLandscape = 2
    }, 
    AssetCategories = {
        Animation = "Animation", 
        Body = "Body", 
        Clothing = "Clothing", 
        Accessory = "Accessory", 
        Emotes = "Emotes"
    }, 
    AssetTypeIdStringToHumanoidDescriptionProp = {
        [tostring(Enum.AssetType.TShirt.Value)] = "GraphicTShirt", 
        [tostring(Enum.AssetType.Hat.Value)] = "HatAccessory", 
        [tostring(Enum.AssetType.Shirt.Value)] = "Shirt", 
        [tostring(Enum.AssetType.Pants.Value)] = "Pants", 
        [tostring(Enum.AssetType.Head.Value)] = "Head", 
        [tostring(Enum.AssetType.Face.Value)] = "Face", 
        [tostring(Enum.AssetType.Torso.Value)] = "Torso", 
        [tostring(Enum.AssetType.RightArm.Value)] = "RightArm", 
        [tostring(Enum.AssetType.LeftArm.Value)] = "LeftArm", 
        [tostring(Enum.AssetType.LeftLeg.Value)] = "LeftLeg", 
        [tostring(Enum.AssetType.RightLeg.Value)] = "RightLeg", 
        [tostring(Enum.AssetType.HairAccessory.Value)] = "HairAccessory", 
        [tostring(Enum.AssetType.FaceAccessory.Value)] = "FaceAccessory", 
        [tostring(Enum.AssetType.NeckAccessory.Value)] = "NeckAccessory", 
        [tostring(Enum.AssetType.ShoulderAccessory.Value)] = "ShouldersAccessory", 
        [tostring(Enum.AssetType.FrontAccessory.Value)] = "FrontAccessory", 
        [tostring(Enum.AssetType.BackAccessory.Value)] = "BackAccessory", 
        [tostring(Enum.AssetType.WaistAccessory.Value)] = "WaistAccessory", 
        [tostring(Enum.AssetType.ClimbAnimation.Value)] = "ClimbAnimation", 
        [tostring(Enum.AssetType.FallAnimation.Value)] = "FallAnimation", 
        [tostring(Enum.AssetType.IdleAnimation.Value)] = "IdleAnimation", 
        [tostring(Enum.AssetType.JumpAnimation.Value)] = "JumpAnimation", 
        [tostring(Enum.AssetType.RunAnimation.Value)] = "RunAnimation", 
        [tostring(Enum.AssetType.SwimAnimation.Value)] = "SwimAnimation", 
        [tostring(Enum.AssetType.WalkAnimation.Value)] = "WalkAnimation", 
        [tostring(Enum.AssetType.DynamicHead.Value)] = "Head"
    }, 
    AnimationAssetTypes = {
        ["48"] = 48, 
        ["50"] = 50, 
        ["51"] = 51, 
        ["52"] = 52, 
        ["53"] = 53, 
        ["54"] = 54, 
        ["55"] = 55, 
        ["61"] = 61, 
        ["78"] = 78
    }, 
    AssetTypeIdToAccessoryTypeEnum = {
        [tostring(Enum.AssetType.Hat.Value)] = Enum.AccessoryType.Hat, 
        [tostring(Enum.AssetType.HairAccessory.Value)] = Enum.AccessoryType.Hair, 
        [tostring(Enum.AssetType.FaceAccessory.Value)] = Enum.AccessoryType.Face, 
        [tostring(Enum.AssetType.NeckAccessory.Value)] = Enum.AccessoryType.Neck, 
        [tostring(Enum.AssetType.ShoulderAccessory.Value)] = Enum.AccessoryType.Shoulder, 
        [tostring(Enum.AssetType.FrontAccessory.Value)] = Enum.AccessoryType.Front, 
        [tostring(Enum.AssetType.BackAccessory.Value)] = Enum.AccessoryType.Back, 
        [tostring(Enum.AssetType.WaistAccessory.Value)] = Enum.AccessoryType.Waist, 
        [tostring(Enum.AssetType.TShirtAccessory.Value)] = Enum.AccessoryType.TShirt, 
        [tostring(Enum.AssetType.ShirtAccessory.Value)] = Enum.AccessoryType.Shirt, 
        [tostring(Enum.AssetType.PantsAccessory.Value)] = Enum.AccessoryType.Pants, 
        [tostring(Enum.AssetType.JacketAccessory.Value)] = Enum.AccessoryType.Jacket, 
        [tostring(Enum.AssetType.SweaterAccessory.Value)] = Enum.AccessoryType.Sweater, 
        [tostring(Enum.AssetType.ShortsAccessory.Value)] = Enum.AccessoryType.Shorts, 
        [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = Enum.AccessoryType.LeftShoe, 
        [tostring(Enum.AssetType.RightShoeAccessory.Value)] = Enum.AccessoryType.RightShoe, 
        [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = Enum.AccessoryType.DressSkirt, 
        [tostring(Enum.AssetType.EyebrowAccessory.Value)] = Enum.AccessoryType.Eyebrow, 
        [tostring(Enum.AssetType.EyelashAccessory.Value)] = Enum.AccessoryType.Eyelash
    }, 
    LayeredAssetTypes = {
        [tostring(Enum.AssetType.TShirtAccessory.Value)] = Enum.AccessoryType.TShirt, 
        [tostring(Enum.AssetType.ShirtAccessory.Value)] = Enum.AccessoryType.Shirt, 
        [tostring(Enum.AssetType.PantsAccessory.Value)] = Enum.AccessoryType.Pants, 
        [tostring(Enum.AssetType.JacketAccessory.Value)] = Enum.AccessoryType.Jacket, 
        [tostring(Enum.AssetType.SweaterAccessory.Value)] = Enum.AccessoryType.Sweater, 
        [tostring(Enum.AssetType.ShortsAccessory.Value)] = Enum.AccessoryType.Shorts, 
        [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = Enum.AccessoryType.LeftShoe, 
        [tostring(Enum.AssetType.RightShoeAccessory.Value)] = Enum.AccessoryType.RightShoe, 
        [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = Enum.AccessoryType.DressSkirt, 
        [tostring(Enum.AssetType.HairAccessory.Value)] = Enum.AccessoryType.Hair, 
        [tostring(Enum.AssetType.EyebrowAccessory.Value)] = Enum.AccessoryType.Eyebrow, 
        [tostring(Enum.AssetType.EyelashAccessory.Value)] = Enum.AccessoryType.Eyelash
    }, 
    AssetCategory = {
        Tops = "Tops", 
        Bottoms = "Bottoms"
    }
};
v0.AssetTypeIdToCategory = {
    [tostring(Enum.AssetType.TShirt.Value)] = v0.AssetCategories.Clothing, 
    [tostring(Enum.AssetType.Hat.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.HairAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.FaceAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.NeckAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.ShoulderAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.FrontAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.BackAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.WaistAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.Shirt.Value)] = v0.AssetCategories.Clothing, 
    [tostring(Enum.AssetType.Pants.Value)] = v0.AssetCategories.Clothing, 
    [tostring(Enum.AssetType.Gear.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.Head.Value)] = v0.AssetCategories.Body, 
    [tostring(Enum.AssetType.Face.Value)] = v0.AssetCategories.Body, 
    [tostring(Enum.AssetType.Torso.Value)] = v0.AssetCategories.Body, 
    [tostring(Enum.AssetType.RightArm.Value)] = v0.AssetCategories.Body, 
    [tostring(Enum.AssetType.LeftArm.Value)] = v0.AssetCategories.Body, 
    [tostring(Enum.AssetType.LeftLeg.Value)] = v0.AssetCategories.Body, 
    [tostring(Enum.AssetType.RightLeg.Value)] = v0.AssetCategories.Body, 
    [tostring(Enum.AssetType.ClimbAnimation.Value)] = v0.AssetCategories.Animation, 
    [tostring(Enum.AssetType.FallAnimation.Value)] = v0.AssetCategories.Animation, 
    [tostring(Enum.AssetType.IdleAnimation.Value)] = v0.AssetCategories.Animation, 
    [tostring(Enum.AssetType.JumpAnimation.Value)] = v0.AssetCategories.Animation, 
    [tostring(Enum.AssetType.RunAnimation.Value)] = v0.AssetCategories.Animation, 
    [tostring(Enum.AssetType.SwimAnimation.Value)] = v0.AssetCategories.Animation, 
    [tostring(Enum.AssetType.WalkAnimation.Value)] = v0.AssetCategories.Animation, 
    [tostring(Enum.AssetType.EmoteAnimation.Value)] = v0.AssetCategories.Animation, 
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.RightShoeAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = v0.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.MoodAnimation.Value)] = v0.AssetCategories.Animation, 
    [tostring(Enum.AssetType.DynamicHead.Value)] = v0.AssetCategories.Body
};
v0.AssetCategoriesLocalized = {
    [v0.AssetCategories.Animation] = "Feature.Catalog.Label.Animation", 
    [v0.AssetCategories.Body] = "Feature.Catalog.Label.Body", 
    [v0.AssetCategories.Clothing] = "Feature.Avatar.Heading.Clothing", 
    [v0.AssetCategories.Accessory] = "Feature.Avatar.Label.Accessory", 
    [v0.AssetCategories.Emotes] = "Feature.Catalog.Label.Emotes"
};
v0.AssetTypeIdToTypeLocalized = {
    [tostring(Enum.AssetType.TShirt.Value)] = "Feature.Avatar.Label.ClassicTShirts", 
    [tostring(Enum.AssetType.Hat.Value)] = "Feature.Avatar.Label.Hat", 
    [tostring(Enum.AssetType.HairAccessory.Value)] = "Feature.Avatar.Label.Hair", 
    [tostring(Enum.AssetType.FaceAccessory.Value)] = "Feature.Avatar.Label.Face", 
    [tostring(Enum.AssetType.NeckAccessory.Value)] = "Feature.Avatar.Label.Neck", 
    [tostring(Enum.AssetType.ShoulderAccessory.Value)] = "Feature.Avatar.Label.Shoulder", 
    [tostring(Enum.AssetType.FrontAccessory.Value)] = "Feature.Avatar.Label.Front", 
    [tostring(Enum.AssetType.BackAccessory.Value)] = "Feature.Avatar.Label.Back", 
    [tostring(Enum.AssetType.WaistAccessory.Value)] = "Feature.Avatar.Label.Waist", 
    [tostring(Enum.AssetType.Shirt.Value)] = "Feature.Avatar.Label.ClassicShirts", 
    [tostring(Enum.AssetType.Pants.Value)] = "Feature.Avatar.Label.ClassicPants", 
    [tostring(Enum.AssetType.Gear.Value)] = "Feature.Avatar.Label.Gear", 
    [tostring(Enum.AssetType.Head.Value)] = "Feature.Avatar.Label.Head", 
    [tostring(Enum.AssetType.Face.Value)] = "Feature.Avatar.Label.Face", 
    [tostring(Enum.AssetType.Torso.Value)] = "Feature.Avatar.Label.Torso", 
    [tostring(Enum.AssetType.RightArm.Value)] = "Feature.Avatar.Label.RightArms", 
    [tostring(Enum.AssetType.LeftArm.Value)] = "Feature.Avatar.Label.LeftArms", 
    [tostring(Enum.AssetType.LeftLeg.Value)] = "Feature.Avatar.Label.LeftLegs", 
    [tostring(Enum.AssetType.RightLeg.Value)] = "Feature.Avatar.Label.RightLegs", 
    [tostring(Enum.AssetType.ClimbAnimation.Value)] = "Feature.Avatar.Label.Climb", 
    [tostring(Enum.AssetType.FallAnimation.Value)] = "Feature.Avatar.Label.Fall", 
    [tostring(Enum.AssetType.IdleAnimation.Value)] = "Feature.Avatar.Label.Idle", 
    [tostring(Enum.AssetType.JumpAnimation.Value)] = "Feature.Avatar.Label.Jump", 
    [tostring(Enum.AssetType.RunAnimation.Value)] = "Feature.Avatar.Label.Run", 
    [tostring(Enum.AssetType.SwimAnimation.Value)] = "Feature.Avatar.Label.Swim", 
    [tostring(Enum.AssetType.WalkAnimation.Value)] = "Feature.Avatar.Label.Walk", 
    [tostring(Enum.AssetType.EmoteAnimation.Value)] = "Feature.Avatar.Label.Emote", 
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = "Feature.Avatar.Label.TShirt", 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = "Feature.Avatar.Label.Shirt", 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = "Feature.Avatar.Label.Pants", 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = "Feature.Avatar.Label.Jacket", 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = "Feature.Avatar.Label.Sweater", 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = "Feature.Avatar.Label.Shorts", 
    [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = "Feature.Avatar.Label.LeftShoe", 
    [tostring(Enum.AssetType.RightShoeAccessory.Value)] = "Feature.Avatar.Label.RightShoe", 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = "Feature.Avatar.Label.DressesAndSkirts", 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = "Feature.Catalog.Label.Eyelash", 
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = "Feature.Catalog.Label.Eyebrow", 
    [tostring(Enum.AssetType.MoodAnimation.Value)] = "Feature.Avatar.Label.Mood", 
    [tostring(Enum.AssetType.DynamicHead.Value)] = "Feature.Avatar.Label.DynamicHead"
};
v0.MoodAnimationAssetTypeId = "78";
v0.DynamicHeadAssetTypeId = "79";
v0.DetailsThumbnailFrameHeight = 250;
v0.LimitedIconFrameSizeXOffset = 9;
v0.LimitedIconFrameSizeYOffset = 4;
v0.DynamicHeadAssetTypes = {
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = true, 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = true, 
    [v0.MoodAnimationAssetTypeId] = true, 
    [v0.DynamicHeadAssetTypeId] = true
};
v0.AccessoryTypeEnumToAssetTypeId = {};
for v1, v2 in pairs(v0.AssetTypeIdToAccessoryTypeEnum) do
    v0.AccessoryTypeEnumToAssetTypeId[v2] = v1;
end;
v0.AssetCategoryToAssetType = {
    [v0.AssetCategory.Tops] = {
        tostring(Enum.AssetType.ShirtAccessory.Value), 
        tostring(Enum.AssetType.TShirtAccessory.Value), 
        (tostring(Enum.AssetType.SweaterAccessory.Value))
    }, 
    [v0.AssetCategory.Bottoms] = {
        tostring(Enum.AssetType.PantsAccessory.Value), 
        tostring(Enum.AssetType.ShortsAccessory.Value), 
        (tostring(Enum.AssetType.DressSkirtAccessory.Value))
    }
};
v0.AssetTypeToAssetCategory = {};
for v3, v4 in pairs(v0.AssetCategoryToAssetType) do
    for _, v6 in ipairs(v4) do
        v0.AssetTypeToAssetCategory[v6] = v3;
    end;
end;
v0.LayeredClothingOrder = {
    [tostring(Enum.AssetType.Pants.Value)] = 0, 
    [tostring(Enum.AssetType.Shirt.Value)] = 1, 
    [tostring(Enum.AssetType.TShirt.Value)] = 2, 
    [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = 3, 
    [tostring(Enum.AssetType.RightShoeAccessory.Value)] = 3, 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = 4, 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = 5, 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = 6, 
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = 7, 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = 8, 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = 9, 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = 10, 
    [tostring(Enum.AssetType.HairAccessory.Value)] = 11, 
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = 3, 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = 3
};
v0.ProductType = {
    CollectibleItem = "Collectible Item"
};
v0.ItemRestrictions = {
    Limited = "Limited", 
    LimitedUnique = "LimitedUnique", 
    Collectible = "Collectible"
};
v0.SaleStatus = {
    OnSale = "OnSale"
};
v0.SaleLocationType = {
    Invalid = 0, 
    ShopOnly = 1, 
    MyExperiencesOnly = 2, 
    ShopAndMyExperiences = 3, 
    ExperiencesById = 4, 
    ShopAndAllExperiences = 5, 
    ExperiencesDevApiOnly = 6, 
    ShopAndExperiencesById = 7
};
v0.CounterSuffix = {
    RequestSucceeded = "RequestSucceeded", 
    RequestRejected = "RequestRejected", 
    RequestFailed = "RequestFailed"
};
v0.Counters = {
    CreateFavoriteForAsset = "CreateFavoriteForAsset", 
    CreateFavoriteForBundle = "CreateFavoriteForBundle", 
    DeleteFavoriteForAsset = "DeleteFavoriteForAsset", 
    DeleteFavoriteForBundle = "DeleteFavoriteForBundle", 
    GetAssetBundles = "GetAssetBundles", 
    GetAssetFavoriteCount = "GetAssetFavoriteCount", 
    GetBundleFavoriteCount = "GetBundleFavoriteCount", 
    GetCharacterModelFromUserId = "GetCharacterModelFromUserId", 
    GetCollectibleResellableInstances = "GetCollectibleResellableInstances", 
    GetCollectibleResellableInstancesRequestSucceededWithoutResult = "GetCollectibleResellableInstancesRequestSucceededWithoutResult", 
    GetEconomyProductInfo = "GetEconomyV1DeprecatedProductInfo", 
    GetExperienceInfo = "GetExperienceInfo", 
    GetExperiencePlayability = "GetExperiencePlayability", 
    GetFavoriteForAsset = "GetFavoriteForAsset", 
    GetFavoriteForBundle = "GetFavoriteForBundle", 
    GetItemDetails = "GetItemDetails", 
    GetItemDetailsRespondedWithUnknownItemType = "GetItemDetailsRespondedWithUnknownItemType", 
    GetPlayerName = "GetPlayerName", 
    GetProductInfo = "MarketplaceServiceGetProductInfo", 
    GetVersionInfo = "GetVersionInfo", 
    PromptLimitedCollectiblesPurchase = "PromptLimitedCollectiblesPurchase", 
    PromptBundlePurchase = "PromptBundlePurchase", 
    PromptUnlimitedCollectiblePurchase = "PromptUnlimitedCollectiblePurchase", 
    PromptRobloxPurchase = "PromptRobloxPurchase", 
    PromptPurchaseUnknownItemType = "PromptPurchaseUnknownItemType", 
    PurchaseSucceededBundle = "PurchaseSucceededBundle", 
    PurchaseSucceededAsset = "PurchaseSucceededAsset", 
    PurchaseSucceededOther = "PurchaseSucceededOther", 
    PurchaseFinished = "PurchaseFinished", 
    ItemDetailPageOpened = "ItemDetailPageOpened", 
    TryOnButtonClicked = "TryOnButtonClicked"
};
return v0;
