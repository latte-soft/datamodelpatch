local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Constants);
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsEnums);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v4 = {};
local v10 = {
    __newindex = function(_, v6)
        error("Attempt to insert into impressions schemas: " .. v6);
    end, 
    __index = function(v7, v8)
        if v8 then
            local v9 = rawget(v7, v8);
            if not v9 then
                warn("No such impressions schema: " .. v8);
            end;
            return v9;
        else
            warn("Nil ImpressionsSchema lookup");
            return ;
        end;
    end
};
v4.defaultItem = v3.buildSchema(v1.ImpressionsEvents.AvatarItems, {
    enumMap = {
        contentType = {
            Asset = v2.MarketplaceItemType.ASSET, 
            Bundle = v2.MarketplaceItemType.BUNDLE
        }
    }, 
    mapping = {
        {
            prop = "index", 
            out = "absPositions"
        }, 
        {
            prop = "itemId", 
            out = "itemId"
        }, 
        {
            prop = "itemType", 
            out = "contentType"
        }, 
        {
            prop = "impressionsGroup", 
            out = "group"
        }, 
        {
            prop = "impressionsSearch", 
            out = "keyword"
        }
    }, 
    groupBy = {
        "itemId"
    }
});
setmetatable(v4, v10);
return v4;
