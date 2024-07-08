local l_Parent_0 = script.Parent;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v2 = require(l_Parent_0.Enums.ItemType);
local v3 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "https?://m.", "https?://www.");
local v4 = v3 .. "thumbs/asset.ashx?assetid=";
local v5 = v3 .. "outfit-thumbnail/image?userOutfitId=%s&width=100&height=100&format=png";
return function(v6, v7)
    local v8 = nil;
    if v6.itemType == v2.Bundle then
        if not v6.costumeId then
            v8 = v6.items[1].id;
        else
            return string.format(v5, v6.costumeId);
        end;
    elseif v6.AssetId ~= nil and v6.AssetId ~= 0 then
        v8 = v6.AssetId;
    elseif v6.IconImageAssetId ~= nil then
        v8 = v6.IconImageAssetId;
    elseif v7 == Enum.Platform.XBoxOne then
        return "rbxasset://textures/ui/Shell/Icons/ROBUXIcon@1080.png";
    end;
    return v4 .. tostring(v8) .. "&x=100&y=100&format=png";
end;
