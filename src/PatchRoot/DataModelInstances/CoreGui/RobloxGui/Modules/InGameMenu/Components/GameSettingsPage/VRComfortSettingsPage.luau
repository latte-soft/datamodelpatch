local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_t_0 = v0.t;
local l_withStyle_0 = v0.UIBlox.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(script.Parent.Parent.Page);
local v7 = require(l_Parent_0.Thunks.CloseMenu);
local v8 = nil;
local v9 = nil;
if game:GetEngineFeature("VRMoreComfortSettings") then
    v8 = require(script.Parent.VRComfortAutoToggleEntry);
    v9 = require(script.Parent.ComfortSettingsEntry);
end;
local v10 = l_Roact_0.PureComponent:extend("VRComfortSettingsPage");
v10.validateProps = l_t_0.strictInterface({
    closeMenu = l_t_0.callback, 
    pageTitle = l_t_0.string
});
local function _()
    local v11 = 0;
    return function()
        v11 = v11 + 1;
        return v11;
    end;
end;
v10.render = function(v13)
    return l_withStyle_0(function(_)
        local v15 = 0;
        local v16;
        do
            local l_v15_0 = v15;
            v16 = function()
                l_v15_0 = l_v15_0 + 1;
                return l_v15_0;
            end;
        end;
        return l_Roact_0.createElement(v6, {
            pageTitle = v13.props.pageTitle, 
            zIndex = 2, 
            position = v13.props.position
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            VRComfortSettings = if not game:GetEngineFeature("VRMoreComfortSettings") then nil else l_Roact_0.createElement(v9, {
                LayoutOrder = v16()
            }), 
            VignetteEnabled = if not game:GetEngineFeature("VRMoreComfortSettings") then nil else l_Roact_0.createElement(v8, {
                LayoutOrder = v16(), 
                labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled", 
                customValueKey = "VignetteEnabledCustomOption", 
                derivedValueKey = "VignetteEnabled"
            }), 
            VRSteppedRotationEnabled = if not game:GetEngineFeature("VRMoreComfortSettings") then nil else l_Roact_0.createElement(v8, {
                LayoutOrder = v16(), 
                labelKey = "CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled", 
                customValueKey = "VRSmoothRotationEnabledCustomOption", 
                derivedValueKey = "VRSmoothRotationEnabled", 
                checkedValue = false
            }), 
            VRThirdPersonFixedCamEnabled = if not game:GetEngineFeature("VRMoreComfortSettings") then nil else l_Roact_0.createElement(v8, {
                LayoutOrder = v16(), 
                labelKey = "CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled", 
                customValueKey = "VRThirdPersonFollowCamEnabledCustomOption", 
                derivedValueKey = "VRThirdPersonFollowCamEnabled", 
                checkedValue = false
            })
        });
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v18)
    return {
        closeMenu = function()
            v18(v7);
        end
    };
end)(v10);
