local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_SpringAnimatedItem_0 = require(l_CorePackages_0.UIBlox).Utility.SpringAnimatedItem;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.selectTopBarHeight);
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useProperty;
local v8 = require(l_Modules_0.AvatarExperience.Common.Context.NamedRefsContext);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.FullViewEntryButton);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useRouteName;
local v13 = Vector2.new(8, 8);
local v14 = Vector2.new(36, 36);
local v15 = {
    dampingRatio = 0.6, 
    frequency = 4.25
};
local v16 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local function v18(v17)
    return {
        Size = UDim2.new(1, 0, 0, v17.height)
    };
end;
local function v20(v19)
    return v19.DeviceOrientation;
end;
local function _()
    return v3.useContext(v8)[l_useRouteName_0() .. "TopPanel"];
end;
local function v27(v22, v23)
    local v24 = l_useProperty_0(v3.useContext(v8)[l_useRouteName_0() .. "TopPanel"], "Size") or UDim2.fromScale(0, 0);
    local v25 = l_useSelector_0(v20) == l_DeviceOrientationMode_0.Portrait;
    local l_v23_0 = v23;
    if not (not v22 or not v25) then
        l_v23_0 = l_v23_0 + (((v14.Y + v13.Y) + 14) + v24.Y.Offset);
    end;
    return l_v23_0;
end;
return function(v28)
    local v29 = v28.isUIFullView or false;
    local v30 = v28.sceneHeight or 0;
    local l_isSceneFullView_0 = v28.isSceneFullView;
    local l_changeViewFunction_0 = v28.changeViewFunction;
    local l_ZIndex_0 = v28.ZIndex;
    local v34 = l_useSelector_0(v6);
    local v35 = l_useSelector_0(v20) == l_DeviceOrientationMode_0.Portrait;
    local v36 = v27(v29, v30);
    local v37 = nil;
    local v38 = 0;
    if v29 then
        v37 = v15;
    else
        v37 = v16;
        v38 = 11;
    end;
    local v39 = not not v35 and v34 or 0;
    local l_createElement_0 = v3.createElement;
    local l_AnimatedFrame_0 = l_SpringAnimatedItem_0.AnimatedFrame;
    local v42 = {};
    local v43 = {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(1, 0, 0, v39), 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = l_ZIndex_0
    };
    local v44 = false;
    if l_changeViewFunction_0 ~= nil then
        v44 = v35 or l_isSceneFullView_0;
    end;
    v43.Visible = v44;
    v42.regularProps = v43;
    v42.animatedValues = {
        height = v36
    };
    v42.mapValuesToProps = v18;
    v42.springOptions = v37;
    return l_createElement_0(l_AnimatedFrame_0, v42, {
        Container = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(1, 0, 1, 0), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 14)
            }), 
            UIPadding = v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v38), 
                PaddingRight = UDim.new(0, v38)
            }), 
            FullViewEntryButton = v3.createElement(v10, {
                isUIFullView = v28.isUIFullView, 
                isSceneFullView = v28.isSceneFullView, 
                changeViewFunction = v28.changeViewFunction, 
                LayoutOrder = 2
            })
        })
    });
end;
