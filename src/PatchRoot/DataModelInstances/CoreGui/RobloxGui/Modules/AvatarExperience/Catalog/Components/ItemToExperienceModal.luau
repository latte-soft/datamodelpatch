local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_CorePackages_0.UIBlox);
local l_ContextualMenu_0 = v7.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v7.App.Menu.MenuDirection;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInstance);
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixItemExpMenuOverlays);
local v19 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXExperienceItemDeepLinkCrashFix);
return v13(function(v20)
    local v21 = l_useDispatch_0();
    local v22 = v12(v6);
    local v23, v24 = v2.useState(nil);
    local v26 = l_useSelector_0(function(v25)
        return v25.ScreenSize;
    end);
    local v28 = l_useSelector_0(function(v27)
        return v27[l_GameIconReducer_0.key];
    end);
    local v29 = v3({
        soldOutTitle = "Feature.Catalog.Label.ItemExperienceSoldOutTitle", 
        soldOutMessage = "Feature.Catalog.Label.ItemExperienceSoldOut", 
        limitReachedTitle = "Feature.Catalog.Label.ItemExperienceLimitReachedTitle", 
        limitReachedMessage = "Feature.Catalog.Label.ItemExperienceLimitReached"
    });
    local l_params_0 = v20.navigation.state.params;
    local l_collectibleData_0 = l_params_0.collectibleData;
    local v32 = l_collectibleData_0 and l_collectibleData_0.experiences;
    local v33 = not v32 and 0 or #v32;
    local v35 = l_useSelector_0(function(v34)
        if (not v19() or not l_collectibleData_0) or not l_collectibleData_0.collectibleItemId then
            if not l_collectibleData_0.collectibleItemId then
                return {};
            else
                return v34.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[l_collectibleData_0.collectibleItemId] or {};
            end;
        else
            return v34.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[l_collectibleData_0.collectibleItemId] or {};
        end;
    end);
    v2.useEffect(function()
        if not v19() or v32 then
            local v36 = {};
            for _, v38 in ipairs(v32) do
                table.insert(v36, v38.id);
            end;
            v21(l_ApiFetchGameIcons_0(v22, v36));
            if v33 == 1 then
                v24(v32[1]);
            end;
            return ;
        else
            return ;
        end;
    end, {
        v32, 
        v22
    });
    v2.useEffect(function()
    end, {
        v28
    });
    v2.useEffect(function()
        if v23 then
            assert(v23, "");
            local v39 = tostring(v23.id);
            local v40 = 0;
            for _, _ in v35, nil, nil do
                v40 = v40 + 1;
            end;
            v4.closeOverlay(v20.navigation);
            local v43 = nil;
            local v44 = nil;
            if l_collectibleData_0.unitsAvailableForConsumption == 0 then
                v43 = v29.soldOutTitle;
                v44 = v29.soldOutMessage;
            elseif l_collectibleData_0.quantityLimitPerUser > 0 and l_collectibleData_0.quantityLimitPerUser <= v40 then
                v43 = v29.limitReachedTitle;
                v44 = v29.limitReachedMessage;
            end;
            if not v43 and not v44 then
                v21(v14(v39, {}));
                return ;
            else
                v20.navigation.navigate(v5.OpenExperienceTraversalPrompt, {
                    gameName = v23.name, 
                    gameUniverseId = v39, 
                    overrideTitle = v43, 
                    overrideBody = if not v44 then nil else v44:gsub("{EXPERIENCE_NAME}", v23.name), 
                    hideConfirmationButton = true
                });
                return ;
            end;
        else
            return ;
        end;
    end, {
        v23, 
        l_collectibleData_0
    });
    local v45 = v2.useCallback(function()
        v4.closeOverlay(v20.navigation);
    end, {
        v20.navigation
    });
    if not v32 or v33 == 1 then
        return ;
    else
        local v46 = {};
        for _, v48 in ipairs(v32) do
            local v49 = v28[tostring(v48.id)];
            table.insert(v46, {
                icon = if not v49 then nil else v49.url, 
                text = v48.name, 
                onActivated = function()
                    v24(v48);
                end
            });
        end;
        return v2.createElement(l_ContextualMenu_0, {
            buttonProps = v46, 
            open = true, 
            menuDirection = if not l_params_0.menuDirection then l_MenuDirection_0.Up else l_params_0.menuDirection, 
            openPositionY = if not l_params_0.openPositionY then UDim.new(1, -76) else l_params_0.openPositionY, 
            openPositionX = UDim.new(0.35, 0), 
            closeBackgroundVisible = not v18() and true or false, 
            screenSize = v26, 
            onDismiss = if not v18() then nil else v45
        });
    end;
end);
