local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsSchema);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsEnums);
local v7 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableKeywordAnalyticsForSearch);
return function(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
    v3.isType(v9, "string", "openItemDetailPage event expects eventContext");
    v3.isType(v10, "number", "openItemDetailPage event expects pageNumber");
    v3.isType(v11, "string", "openItemDetailPage event expects categoryName");
    v3.isType(v12, "string", "openItemDetailPage event expects subCategoryIndex");
    v3.isTypeOrNil(v13, "string", "openItemDetailPage event expects sortType");
    v3.isTypeOrNil(v14, "table", "openItemDetailPage event expects filters");
    v3.isType(v15, "number", "openItemDetailPage event expects rank");
    v3.isType(v16, "string", "openItemDetailPage event expects itemId");
    v3.isType(v17, "string", "openItemDetailPage event expects itemType");
    v3.isTypeOrNil(v18, "string", "openItemDetailPage event expects itemSubType");
    v3.isTypeOrNil(v19, "boolean", "openItemDetailPage event expects fromProfile");
    v3.isTypeOrNil(v20, "string", "openItemDetailPage event expects requestId");
    local v21 = v14 and l_HttpService_0:JSONEncode(v14);
    local l_enumMap_0 = v5.defaultItem.enumMap;
    v8:setRBXEventStream(v9, "marketplaceOrganicFELog", {
        feature = not not v19 and v4.ProfileAnalyticsTag or v4.AnalyticsTag, 
        page = v10, 
        actionType = v6.ActionType.ITEM_CLICK, 
        requestId = v20, 
        nav = v11, 
        subNav = v12, 
        sort = v13, 
        filters = v21, 
        absPositions = v15, 
        itemId = v16, 
        contentType = if not not l_enumMap_0 and l_enumMap_0.contentType then l_enumMap_0.contentType[v17] else nil, 
        itemSubType = v18, 
        keyword = if not v7() then nil else v14.keyword
    });
    v8:setRBXEventStream(v9, "itemDetailReferral", {
        feature = not not v19 and v4.ProfileAnalyticsTag or v4.AnalyticsTag, 
        page = v10, 
        nav = v11, 
        subNav = v12, 
        sort = v13, 
        filters = v21, 
        rank = v15, 
        itemID = v16, 
        itemType = v17, 
        itemSubType = v18
    });
end;
