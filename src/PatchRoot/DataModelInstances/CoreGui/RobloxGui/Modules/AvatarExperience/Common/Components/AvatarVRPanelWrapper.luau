local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v7 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_AppPanel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).AppPanel3D;
local l_Panel3D_0 = v4.Core.VR.Panel3D;
local v11 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local v13 = require(l_Modules_0.LuaApp.Navigation.CurrentTabContext);
local v14 = require(l_Modules_0.LuaApp.Navigation.SwitchNavigatorVisibleContext);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_RoundedCornersFrame_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).RoundedCornersFrame;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v18 = if not v7.GetFFlagAdjustVRFloor() then l_Panel3D_0 else l_AppPanel3D_0;
local function v27(v19, v20)
    local v21 = {};
    local v22 = v19.previousPages or {};
    for _, v24 in v22, nil, nil do
        local l_VRPanelPlacement_0 = v12[v24.name].VRPanelPlacement;
        if l_VRPanelPlacement_0 == "None" then
            l_VRPanelPlacement_0 = "Left";
        end;
        l_VRPanelPlacement_0 = l_VRPanelPlacement_0 or "Left";
        v21[l_VRPanelPlacement_0] = (v21[l_VRPanelPlacement_0] or 0) + 1;
    end;
    local v26 = v21[v20] or 0;
    if v19.isOverlayVisible then
        v26 = v26 + 1;
    end;
    return (Vector3.new(0, 0, v26 * v15.VR.SPACE_BETWEEN_STACKED_PANELS));
end;
return function(v28)
    local v29 = v11();
    local v30 = l_useStyle_0();
    local v31 = v15.VR.PanelInfo[v28.panelPlacement or "Left"];
    if v28.panelPlacement ~= "None" then
        local v32 = v2.useMemo(function()
            return (v27(v29, v28.panelPlacement));
        end, {});
        return v2.createElement(v13.Consumer, {
            render = function(v33)
                return v3.createElement(v14.Consumer, {
                    render = function(v34)
                        local l_createElement_0 = v2.createElement;
                        local l_v18_0 = v18;
                        local v37 = {};
                        local v38 = not v34;
                        if not v38 then
                            v38 = true;
                            if v28.visible ~= false then
                                v38 = v33 ~= v8.AvatarExperienceRoot;
                            end;
                        end;
                        v37.hidden = v38;
                        v37.partSize = v31.PartSize;
                        v37.offset = v31.Offset + v32;
                        v37.virtualScreenSize = v31.VirtualScreenSize;
                        v37.panelName = v28.panelPlacement;
                        return l_createElement_0(l_v18_0, v37, if not v28.roundedCornersFrame then v28[v3.Children] else v2.createElement(l_RoundedCornersFrame_0, {
                            cornerRadius = 10, 
                            backgroundColor = v30.Theme.BackgroundDefault.Color, 
                            backgroundTransparency = 0
                        }, v28[v3.Children]));
                    end
                });
            end
        });
    else
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ClipsDescendants = false, 
            BorderSizePixel = 0
        }, v28[v3.Children]);
    end;
end;
