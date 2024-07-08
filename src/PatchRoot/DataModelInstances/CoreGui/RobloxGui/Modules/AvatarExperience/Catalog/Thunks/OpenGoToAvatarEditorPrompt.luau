local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v4 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v5 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v6 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v7 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v8 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v9 = {
    toastMessage = "Feature.Avatar.Message.AlreadyAcquired", 
    isLocalized = false, 
    toastType = v4.InformationMessage
};
return function(v10, v11, v12, v13, v14)
    return function(v15)
        local v16 = v15:getState();
        local l_name_0 = v12.opaque.name;
        local v18 = nil;
        if not v8 then
            local v19 = v3(v16.AvatarExperience.Common, v13, v14);
            if v14 == v2.ItemType.Asset then
                v18 = v19.assetType;
            elseif v14 == v2.ItemType.Bundle then
                v18 = v19.bundleType;
            end;
        else
            local v20 = v7(v16.AvatarExperience, v13, v14);
            if v20 then
                v18 = v20.itemSubType;
            end;
        end;
        if l_name_0 == v1.AvatarEditor then
            return v15:dispatch(v5(v9));
        else
            v15:dispatch(v6(function()
                v11.navigate(v1.LeaveCatalogToAvatarPrompt, {
                    itemType = v14, 
                    itemSubType = v18, 
                    onOverlayClosed = v10
                });
            end));
            return ;
        end;
    end;
end;
