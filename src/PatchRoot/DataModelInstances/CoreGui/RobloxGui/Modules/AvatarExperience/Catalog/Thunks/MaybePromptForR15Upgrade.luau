local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v2 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v3 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v5 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v6 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
return function(v7, v8, v9, v10, v11, v12)
    return function(v13)
        local v14 = v13:getState();
        if v14.AvatarExperience.AvatarEditor.Character.AvatarType ~= v1.AvatarType.R6 then
            return false;
        else
            local v15 = false;
            local v16 = nil;
            local l_Animations_0 = v1.BundleTypeIdStrings.Animations;
            if not v6 then
                local v18 = v2(v14.AvatarExperience.Common, v8, v9);
                local v19 = nil;
                local v20 = nil;
                if not v6 then
                    if v9 == v1.ItemType.Bundle then
                        v20 = v18.bundleType;
                    elseif v9 == v1.ItemType.Asset then
                        v19 = v18.assetType;
                    end;
                end;
                if v20 and v20 == l_Animations_0 then
                    v15 = true;
                    v16 = "Feature.Avatar.Message.R15AnimationsPrompt";
                elseif v19 and v19 == v1.AssetTypeIdStrings.EmoteAnimation then
                    v15 = true;
                    v16 = v7.state.routeName == v4.ProfilePictureEditorEmotes and "Feature.Avatar.Label.PPEEmoteR15Warning" or "Feature.Avatar.Message.R15EmotesPrompt";
                end;
            else
                local v21 = v3(v14.AvatarExperience, v8, v9);
                if v21 then
                    if v21.itemType == v1.ItemType.Bundle and v21.itemSubType == v1.BundleTypeIdStrings.Animations then
                        v15 = true;
                        v16 = "Feature.Avatar.Message.R15AnimationsPrompt";
                    elseif v21.itemType == v1.ItemType.Asset and v21.itemSubType == v1.AssetTypeIdStrings.EmoteAnimation then
                        v15 = true;
                        v16 = v7.state.routeName == v4.ProfilePictureEditorEmotes and "Feature.Avatar.Label.PPEEmoteR15Warning" or "Feature.Avatar.Message.R15EmotesPrompt";
                    end;
                end;
            end;
            if not v15 then
                return false;
            else
                if v12 then
                    v13:dispatch(v5(v7));
                end;
                v7.navigate(v4.R15UpgradePrompt, {
                    onOverlayClosed = v10, 
                    onOverlayClosedPostClose = v11, 
                    bodyTextKey = v16
                });
                return true;
            end;
        end;
    end;
end;
