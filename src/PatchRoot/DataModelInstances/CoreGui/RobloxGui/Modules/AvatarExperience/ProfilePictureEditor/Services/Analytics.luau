local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v2 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v3 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v5 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounter);
return {
    get = function(v6)
        local v7 = v3.get(v6);
        return {
            profilePictureEditorButton = function()
                v7.EventStream:sendEventDeferred("ClickProfilePictureEditorButton", "avatarProfilePictureEditTap", {
                    feature = v1.AnalyticsTag, 
                    entry_point = "dropdown"
                });
            end, 
            profilePictureEditorOpenedFromLandingPage = function()
                v7.EventStream:sendEventDeferred("ProfilePictureEditorLandingPageButtonClicked", "avatarProfilePictureEditTap", {
                    feature = v1.AnalyticsTag, 
                    entry_point = "home"
                });
            end, 
            clickShopForMore = function(v8, v9)
                local v10 = v4()[v8];
                if v10 then
                    local v11 = v10.Subcategories and v10.Subcategories[v9];
                    v7.EventStream:sendEventDeferred("ProfilePictureEditorEmotesPage", "avatarProfilePictureEmoteShop", {
                        feature = v1.AnalyticsTag, 
                        nav = not not v10 and v10.Name or "", 
                        subNav = not not v11 and v11.Name or ""
                    });
                end;
            end, 
            clickFinalSave = function(v12, v13, v14)
                local _ = nil;
                v7.EventStream:sendEventDeferred("ProfilePictureEditorFinalPage", v12 == v2.Closeup and "clickFinalSaveCloseup" or "clickFinalSaveFullBody", {
                    feature = v1.AnalyticsTag, 
                    isDefaultPosition = v13, 
                    emoteAssetId = v14
                });
                v5(v7, "AXUpdateProfilePicture");
            end, 
            clickNextFromEmotesPage = function(v16)
                v7.EventStream:sendEventDeferred("ProfilePictureEditorEmotesPage", "avatarProfilePictureEmote", {
                    feature = v1.AnalyticsTag, 
                    asset_id = v16
                });
            end, 
            clickNextFromCameraPage = function(v17, v18)
                v7.EventStream:sendEventDeferred("ProfilePictureEditorCameraPage", "avatarProfilePictureCrop", {
                    feature = v1.AnalyticsTag, 
                    zoom = not v17 and 0 or 1, 
                    rotate = not v18 and 0 or 1
                });
            end, 
            clickDefaultPositionsFromCameraPage = function()
                v7.EventStream:sendEventDeferred("ProfilePictureEditorCameraPage", "avatarProfilePictureCropDefault", {
                    feature = v1.AnalyticsTag
                });
            end
        };
    end
};
