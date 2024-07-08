local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiControllerBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v4 = require(l_Parent_0.ReactFocusNavigation);
local _ = require(l_script_FirstAncestor_0.Components.ControllerBar);
local l_LocalizationRoactContext_0 = require(l_Parent_0.Localization).LocalizationRoactContext;
local l_useHeldProgressByEvent_0 = require(l_script_FirstAncestor_0.Hooks.ControllerBarContext).useHeldProgressByEvent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FFlagFixControllerBarButtonNames_0 = require(l_Parent_0.SharedFlags).FFlagFixControllerBarButtonNames;
local v10 = {
    [Enum.KeyCode.Thumbstick1] = {
        vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Vertical.png", 
        horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Horizontal.png"
    }, 
    [Enum.KeyCode.Thumbstick2] = {
        vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Vertical.png", 
        horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Horizontal.png"
    }
};
local v11 = {
    Enum.KeyCode.ButtonA, 
    Enum.KeyCode.ButtonX, 
    Enum.KeyCode.ButtonY, 
    Enum.KeyCode.ButtonL3, 
    Enum.KeyCode.ButtonR3, 
    Enum.KeyCode.Thumbstick1, 
    Enum.KeyCode.Thumbstick2, 
    Enum.KeyCode.ButtonStart
};
local v12 = {
    [Enum.KeyCode.ButtonA] = true, 
    [Enum.KeyCode.ButtonB] = true, 
    [Enum.KeyCode.ButtonL1] = true, 
    [Enum.KeyCode.ButtonR1] = true
};
local v13 = {
    [Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", 
    [Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", 
    [Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY.png", 
    [Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", 
    [Enum.KeyCode.ButtonL3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonL3.png", 
    [Enum.KeyCode.ButtonR3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonR3.png", 
    [Enum.KeyCode.Thumbstick1] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Directional.png", 
    [Enum.KeyCode.Thumbstick2] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Directional.png", 
    [Enum.KeyCode.ButtonStart] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonStart.png"
};
local v14 = {
    [Enum.KeyCode.ButtonY] = {
        [l_FocusNavigationEventNameEnum_0.Search] = v13[Enum.KeyCode.ButtonY], 
        [l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo] = v13[Enum.KeyCode.ButtonY]
    }, 
    [Enum.KeyCode.ButtonX] = {
        [l_FocusNavigationEventNameEnum_0.Play] = v13[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.SeeAll] = v13[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.AcceptFriendRequest] = v13[Enum.KeyCode.ButtonX], 
        [l_FocusNavigationEventNameEnum_0.AddFriend] = if not l_FFlagFixControllerBarButtonNames_0 then nil else v13[Enum.KeyCode.ButtonX]
    }, 
    [Enum.KeyCode.ButtonA] = {
        [l_FocusNavigationEventNameEnum_0.HoldToPlay] = v13[Enum.KeyCode.ButtonA]
    }, 
    [Enum.KeyCode.ButtonR3] = {
        [l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest] = v13[Enum.KeyCode.ButtonR3]
    }, 
    [Enum.KeyCode.ButtonStart] = {
        [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = v13[Enum.KeyCode.ButtonStart]
    }
};
local v15 = {
    [l_FocusNavigationEventNameEnum_0.Search] = "CommonUI.Features.Label.ControllerBar.Search", 
    [l_FocusNavigationEventNameEnum_0.SeeAll] = "Feature.Home.ActionSeeAll", 
    [l_FocusNavigationEventNameEnum_0.Play] = "Common.VisitGame.Label.Play", 
    [l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo] = "Feature.GameDetails.Label.LearnMore", 
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.ToPlaySuffix", 
    [l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest] = "Feature.AddFriends.Action.IgnoreFriendRequest", 
    [l_FocusNavigationEventNameEnum_0.AcceptFriendRequest] = not l_FFlagFixControllerBarButtonNames_0 and "Feature.PlayerSearchResults.Action.AddFriend" or "Feature.Friends.Action.AcceptFriend", 
    [l_FocusNavigationEventNameEnum_0.AddFriend] = if not l_FFlagFixControllerBarButtonNames_0 then nil else "Feature.PlayerSearchResults.Action.AddFriend", 
    [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = "Feature.Catalog.Heading.QuickMenu"
};
local v16 = {
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = "CommonUI.Features.Label.ControllerBar.HoldPrefix"
};
local v17 = {
    [l_FocusNavigationEventNameEnum_0.HoldToPlay] = true
};
local function v25(v18, v19, v20)
    if not v19.axes then
        if not v19.key then
            return {};
        else
            return {
                {
                    icon = v13[v18], 
                    text = v20:Format(v19.key)
                }
            };
        end;
    else
        local l_vertical_0 = v19.axes.vertical;
        local l_horizontal_0 = v19.axes.horizontal;
        local v23 = v10[v18];
        local v24 = {};
        if l_vertical_0 then
            table.insert(v24, {
                icon = v23.vertical, 
                text = v20:Format(l_vertical_0.key)
            });
        end;
        if l_horizontal_0 then
            table.insert(v24, {
                icon = v23.horizontal, 
                text = v20:Format(l_horizontal_0.key)
            });
        end;
        return v24;
    end;
end;
useControllerBarProps = function()
    local v26 = v4.useActiveEventMap();
    local v27 = v2.useContext(l_LocalizationRoactContext_0);
    local v28 = l_useHeldProgressByEvent_0();
    local v29 = {};
    local v31 = l_useSelector_0(function(v30)
        if not v30.GamepadBottomBar then
            return nil;
        else
            return v30.GamepadBottomBar.boundInputs;
        end;
    end);
    for _, v33 in v11, nil, nil do
        if v31 then
            if not v12[v33] then
                local v34 = v31[v33];
                if v34 then
                    for _, v36 in (v25(v33, v34, v27)), nil, nil do
                        table.insert(v29, v36);
                    end;
                end;
            else
                continue;
            end;
        end;
        local v37 = v26[v33];
        if v37 then
            local v38 = v14[v33];
            local v39 = if not v38 then nil else v38[v37];
            local v40 = v15[v37];
            local v41 = if not v40 then nil else v27:Format(v40);
            local v42 = v16[v37];
            local v43 = if not v42 then nil else v27:Format(v42);
            local v44 = v28[v37];
            local v45 = v17[v37];
            if not (not v39 or not v41) then
                table.insert(v29, {
                    icon = v39, 
                    text = v41, 
                    actionText = v43, 
                    progress = v44, 
                    hasProgress = v45
                });
            end;
        end;
    end;
    return {
        items = v29
    };
end;
return useControllerBarProps;
