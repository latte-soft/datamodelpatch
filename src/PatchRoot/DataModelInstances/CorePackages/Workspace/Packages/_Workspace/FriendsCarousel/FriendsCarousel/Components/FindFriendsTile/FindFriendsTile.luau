local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v7 = require(l_script_FirstAncestor_0.Components.AddFriendsTileCircular);
local v8 = require(l_script_FirstAncestor_0.Components.AddFriendsTileSquare);
local v9 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v9.EventNames;
local l_useAnalytics_0 = v9.useAnalytics;
local l_useEffectOnce_0 = v1.Hooks.useEffectOnce;
local v13 = require(l_Parent_0.UIBlox).App.ImageSet.Images["icons/menu/friends_large"];
local v14 = require(l_script_FirstAncestor_0.Components.ButtonTileCircular);
local l_getFFlagUpdateFriendCarousel10ft_0 = v1.getFFlagUpdateFriendCarousel10ft;
local l_FFlagFriendsCarouselInjectSocialBtn_0 = require(l_Parent_0.SharedFlags).FFlagFriendsCarouselInjectSocialBtn;
local function _(v17)
    local v18;
    if type(v17) == "number" then
        if v17 > 0 then
            v18 = v17;
            if v18 then
                goto label0;
            end;
        end;
        return nil;
    elseif type(v17) == "string" then
        if v17 ~= "" then
            v18 = v17;
            if v18 then
                goto label0;
            end;
        end;
        return nil;
    else
        v18 = nil;
    end;
    ::label0::;
    return v18;
end;
return function(v20)
    l_React_0.useEffect(function()
        if v20.onDidMount then
            v20.onDidMount();
        end;
    end, {});
    local v23 = l_React_0.useMemo(function()
        local l_badgeValue_0 = v20.badgeValue;
        local v22;
        if type(l_badgeValue_0) == "number" then
            if l_badgeValue_0 > 0 then
                v22 = l_badgeValue_0;
                if v22 then
                    goto label1;
                end;
            end;
            return nil;
        elseif type(l_badgeValue_0) == "string" then
            if l_badgeValue_0 ~= "" then
                v22 = l_badgeValue_0;
                if v22 then
                    goto label1;
                end;
            end;
            return nil;
        else
            v22 = nil;
        end;
        ::label1::;
        return v22;
    end, {
        v20.badgeValue
    });
    local v24 = l_useAnalytics_0();
    l_useEffectOnce_0(function()
        v24.fireEvent(l_EventNames_0.ContactImporterOnAddFriends);
    end, v23);
    local v25 = l_useLocalization_0({
        addFriendText = v6.UpdatedFindFriendsText, 
        findFriendsText = v6.FindFriendsText
    });
    if not v20.showNewAddFriendsUIVariant then
        if not l_FFlagFriendsCarouselInjectSocialBtn_0 then
            return (l_Roact_0.createElement(v7, {
                onActivated = v20.onActivated, 
                labelText = v25.addFriendText, 
                badgeValue = v23, 
                thumbnailSize = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else v20.tileSize
            }));
        else
            return (l_Roact_0.createElement(v14, {
                onActivated = v20.onActivated, 
                title = v25.addFriendText, 
                badgeValue = v23, 
                tileSize = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else v20.tileSize, 
                backgroundColor = v20.backgroundColor, 
                noBorder = v20.noBorder, 
                icon = v20.icon or v13, 
                iconColor = v20.iconColor
            }));
        end;
    else
        return (l_Roact_0.createElement(v8, {
            badgeValue = v23, 
            onActivated = v20.onActivated, 
            labelText = v25.findFriendsText
        }));
    end;
end;
