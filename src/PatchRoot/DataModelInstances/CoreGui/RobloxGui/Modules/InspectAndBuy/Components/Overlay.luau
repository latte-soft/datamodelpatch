local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v5 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v6 = v5.FocusNavigationService.new(v5.EngineInterface.CoreGui);
local v7 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_Provider_0 = v7.FocusNavigableSurfaceRegistry.Provider;
local v9 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v7.FocusNavigableSurfaceIdentifierEnum;
local l_Parent_0 = script.Parent.Parent;
local v12 = require(l_Parent_0.Colors);
local v13 = require(l_Parent_0.Components.OverlayComponents);
local function v15(v14)
    return v13[v14.overlay.overlay];
end;
local function v17(v16)
    return v16.overlay.overlayProps;
end;
return function(_)
    local v19 = l_useSelector_0(v15);
    return v2.createElement(v5.FocusNavigationContext.Provider, {
        value = v6
    }, {
        FocusNavigationRegistryProvider = v2.createElement(l_Provider_0, nil, {
            FocusNavigationEffects = v2.createElement(v9, {
                selectionGroupName = "InspectAndBuyOverlay", 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
            }, {
                OverlayContainer = v2.createElement("Frame", {
                    BackgroundTransparency = l_useStyle_0().Tokens.Semantic.Color.Common.Overlay.Transparency, 
                    BackgroundColor3 = v12.Black, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    Visible = v19 ~= nil
                }, {
                    Overlay = not not v19 and v2.createElement(v19, (l_useSelector_0(v17))) or nil
                })
            })
        })
    });
end;
