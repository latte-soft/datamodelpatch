local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local v4 = require(l_Parent_0.Common.TextKeys);
local v5 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v5.EventNames;
local l_BtnValues_0 = v5.BtnValues;
local l_CarouselGenericSquareTile_0 = v1.SocialCommon.Components.CarouselGenericSquareTile;
local l_UIBlox_0 = v1.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local v12 = l_Images_0["icons/graphic/findfriends_large"];
local v13 = l_Images_0["icons/navigation/pushRight"];
return function(v14)
    local v15 = l_useLocalization_0({
        findFriendsLabel = v4.FindFriendsLabel, 
        seeAllLabel = v4.SeeAllLabel, 
        newTextBadge = v4.NewText
    });
    local function _(v16, v17)
        return function()
            v14.fireAnalyticsEvent(l_EventNames_0.CarouselGenericTileClicked, {
                btn = v16
            });
            v14.goToAddFriendsPage(v17);
        end;
    end;
    if v14.id == l_BtnValues_0.FindFriends.rawValue() then
        local l_createElement_0 = l_React_0.createElement;
        local l_l_CarouselGenericSquareTile_0_0 = l_CarouselGenericSquareTile_0;
        local v21 = {
            borderThickness = 1, 
            badgeValue = if not v14.shouldShowContactImporterBadge then nil else v15.newTextBadge, 
            icon = v12, 
            labelText = v15.findFriendsLabel
        };
        local v22 = l_BtnValues_0.FindFriends.rawValue();
        local v23 = true;
        v21.onActivated = function()
            v14.fireAnalyticsEvent(l_EventNames_0.CarouselGenericTileClicked, {
                btn = v22
            });
            v14.goToAddFriendsPage(v23);
        end;
        return l_createElement_0(l_l_CarouselGenericSquareTile_0_0, v21);
    elseif v14.id == l_BtnValues_0.SeeAll.rawValue() then
        local l_createElement_1 = l_React_0.createElement;
        local l_l_CarouselGenericSquareTile_0_1 = l_CarouselGenericSquareTile_0;
        local v26 = {
            icon = v13, 
            iconSize = l_IconSize_0.Medium, 
            labelText = v15.seeAllLabel
        };
        local v27, v28 = l_BtnValues_0.SeeAll.rawValue();
        v26.onActivated = function()
            v14.fireAnalyticsEvent(l_EventNames_0.CarouselGenericTileClicked, {
                btn = v27
            });
            v14.goToAddFriendsPage(v28);
        end;
        return l_createElement_1(l_l_CarouselGenericSquareTile_0_1, v26);
    else
        return nil;
    end;
end;
