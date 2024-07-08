local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_PlayabilityStatusEnum_0 = require(l_CorePackages_0.Workspace.Packages.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local v4 = require(script.Parent.Parent.Flags.GetFFlagIBEnableCollectiblePurchaseForUnlimited);
local v5 = {
    [1] = {
        id = 100425207, 
        name = "Reinforced Wizard", 
        assetType = {
            id = 8, 
            name = "Hat"
        }
    }, 
    [2] = {
        id = 2510238627, 
        name = "Rthro Run", 
        assetType = {
            id = 53, 
            name = "Run Animation"
        }
    }, 
    [3] = {
        id = 2807164805, 
        name = "Mech Golem - Head", 
        assetType = {
            id = 17, 
            name = "Head"
        }
    }
};
local v6 = {
    data = {
        [1] = {
            id = 451, 
            name = "test name", 
            description = "test description", 
            bundleType = "testBundleType", 
            items = {
                [1] = {
                    owned = false, 
                    id = 2510230574, 
                    name = "test asset name"
                }, 
                [2] = {
                    owned = false, 
                    id = 2510233257, 
                    name = "test asset name 2"
                }, 
                [3] = {
                    owned = false, 
                    type = "UserOutfit", 
                    id = 2510233258, 
                    name = "Outfit"
                }
            }, 
            creator = {
                id = 1, 
                name = "test creator name"
            }, 
            product = {
                id = 480872498, 
                isForSale = true, 
                priceInRobux = 250
            }
        }
    }
};
local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
l_HumanoidDescription_0.HatAccessory = 1;
l_HumanoidDescription_0.LeftArm = 2;
l_HumanoidDescription_0.ClimbAnimation = 3;
l_HumanoidDescription_0.BodyTypeScale = 0.3;
l_HumanoidDescription_0.LeftLegColor = Color3.new(0, 0, 0);
l_HumanoidDescription_0.GraphicTShirt = 4;
local l_HumanoidDescription_1 = Instance.new("HumanoidDescription");
l_HumanoidDescription_1:SetEmotes({
    Wave = {
        1
    }, 
    Laugh = {
        2
    }, 
    Cheer = {
        3
    }
});
local l_HumanoidDescription_2 = Instance.new("HumanoidDescription");
local v10 = {
    assetId = 123, 
    userId = 401784814, 
    created = ""
};
local v11 = {
    Name = "test name", 
    Description = "test description", 
    PriceInRobux = 100, 
    Creator = {
        Id = 1, 
        Name = "TEST CREATOR"
    }, 
    AssetId = 100425207, 
    AssetTypeId = 8, 
    ProductId = 18929548
};
local v12 = {
    Owned = true, 
    IsPurchasable = false, 
    Id = 100425207, 
    ItemType = "Asset"
};
local v13 = {
    purchasable = false, 
    reason = "InsufficientFunds", 
    price = 200, 
    assetId = 10
};
local v14 = {
    playabilityStatus = l_PlayabilityStatusEnum_0.Playable, 
    universeId = 13, 
    isPlayable = true
};
local v15 = {
    name = "fakename", 
    id = 13, 
    rootPlaceId = 17
};
local function v17(v16)
    return v2.resolve((v1.Dictionary.join(v11, {
        AssetId = v16
    })));
end;
local function v20(v18)
    local v19 = v1.Dictionary.join(v11, {
        AssetId = v18
    });
    v19.Creator.Id = 2;
    return v2.resolve(v19);
end;
local function v23(v21, v22)
    if v4() then
        return v2.resolve((v1.Dictionary.join(v12, {
            Id = v21, 
            ItemType = v22
        })));
    else
        return v2.resolve();
    end;
end;
local v24 = {
    data = {
        {
            assetId = 17, 
            creatingUniverseId = 13
        }
    }
};
local function v26(v25)
    return v2.resolve((v1.Dictionary.join(v24, {
        AssetId = v25
    })));
end;
local function v28(v27)
    return v2.resolve({
        (v1.Dictionary.join(v14, {
            universeId = v27
        }))
    });
end;
local function v30(v29)
    return v2.resolve({
        data = {
            (v1.Dictionary.join(v15, {
                id = v29
            }))
        }
    });
end;
local function v32(_)
    return v2.resolve(v6);
end;
local function v34(_)
    return v2.resolve("TEST");
end;
local function v36(_)
    return v2.resolve();
end;
local function v38(_)
    return v2.resolve();
end;
local function v40(_)
    return v2.resolve();
end;
local function v42(_)
    return v2.resolve();
end;
local function v44(_)
    return v2.resolve(120);
end;
local function v46(_)
    return v2.resolve(120);
end;
local function v48(v47)
    if v47 == "GetFavoriteModel" then
        return v2.resolve(v10);
    else
        return v2.resolve("null");
    end;
end;
local function v50(v49)
    if v49 == "GetFavoriteModel" then
        return v2.resolve(v10);
    else
        return v2.resolve("null");
    end;
end;
local function v52(_)
    return v2.resolve(v13);
end;
local function v54(_)
    return v2.resolve();
end;
local function v57(_, _)
    return v2.reject("Failed to access network service");
end;
local v58 = {};
v58.__index = v58;
v58.new = function(v59, v60)
    local v61 = nil;
    v61 = if not v59 then {
        getProductInfo = not not v60 and v20 or v17, 
        getPlayerName = v34, 
        getAssetBundles = v32, 
        createFavoriteForAsset = v36, 
        createFavoriteForBundle = v38, 
        deleteFavoriteForAsset = v40, 
        deleteFavoriteForBundle = v42, 
        getAssetFavoriteCount = v44, 
        getBundleFavoriteCount = v46, 
        getFavoriteForAsset = v48, 
        getFavoriteForBundle = v50, 
        getEconomyProductInfo = v52, 
        getModelFromUserId = v54, 
        getVersionInfo = v26, 
        getExperiencePlayability = v28, 
        getExperienceInfo = v30, 
        getItemDetails = if not v4() then nil else v23
    } else {
        getProductInfo = v57, 
        getPlayerName = v57, 
        getAssetBundles = v57, 
        createFavoriteForAsset = v57, 
        createFavoriteForBundle = v57, 
        deleteFavoriteForAsset = v57, 
        deleteFavoriteForBundle = v57, 
        getAssetFavoriteCount = v57, 
        getBundleFavoriteCount = v57, 
        getFavoriteForAsset = v57, 
        getFavoriteForBundle = v57, 
        getEconomyProductInfo = v57, 
        getModelFromUserId = v57, 
        getVersionInfo = v57, 
        getExperiencePlayability = v57, 
        getExperienceInfo = v57, 
        getItemDetails = if not v4() then nil else v57
    };
    setmetatable(v61, {
        __tostring = function()
            return "MockService(Network)";
        end
    });
    return v61;
end;
v58.GetMockAssetData = function()
    return v5;
end;
v58.GetMockHumanoidDescription = function()
    return l_HumanoidDescription_0;
end;
v58.GetMockHumanoidDescriptionEmpty = function()
    return l_HumanoidDescription_2;
end;
v58.GetMockPlayerName = function()
    return "TEST";
end;
v58.GetMockAssetBundlesData = function()
    return v6;
end;
v58.GetMockFavoriteCount = function()
    return 120;
end;
v58.GetFavoriteModelId = function()
    return "GetFavoriteModel";
end;
v58.GetProductInfo = function()
    return v11;
end;
v58.GetEconomyProductInfo = function()
    return v13;
end;
v58.GetMockHumanoidDescriptionEmotes = function()
    return l_HumanoidDescription_1;
end;
v58.GetVersionInfo = function()
    return v24;
end;
v58.GetExperiencePlayability = function()
    return {
        v14
    };
end;
v58.GetExperienceInfo = function()
    return {
        data = {
            v15
        }
    };
end;
return v58;
