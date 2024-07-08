local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v6 = require(l_Modules_0.LuaApp.FitChildren);
local v7 = require(l_Modules_0.LuaApp.Components.FramePopOut);
local v8 = require(l_Modules_0.LuaApp.Components.FramePopup);
local v9 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v10 = v3.PureComponent:extend("FormBasedContextualMenu");
v10.defaultProps = {
    enablePopUpCancelButton = true
};
v10.render = function(v11)
    local l_anchorSpaceSize_0 = v11.props.anchorSpaceSize;
    local l_anchorSpacePosition_0 = v11.props.anchorSpacePosition;
    local l_itemWidth_0 = v11.props.itemWidth;
    local v15 = v11.props[v3.Children];
    local l_screenSize_0 = v11.props.screenSize;
    return v3.createElement(not not (v11.props.formFactor == l_FormFactor_0.WIDE) and v7 or v8, {
        onCancel = v11.props.closeContextualMenu, 
        enableCancelButton = v11.props.enablePopUpCancelButton, 
        itemWidth = l_itemWidth_0, 
        parentShape = {
            x = l_anchorSpacePosition_0.X, 
            y = l_anchorSpacePosition_0.Y, 
            width = l_anchorSpaceSize_0.X, 
            height = l_anchorSpaceSize_0.Y, 
            parentWidth = l_screenSize_0.X, 
            parentHeight = l_screenSize_0.Y
        }
    }, v3.createElement(v6.FitFrame, {
        BackgroundTransparency = 1, 
        fitAxis = v6.FitAxis.Height, 
        Size = UDim2.new(0, l_itemWidth_0, 0, 0), 
        Selectable = false
    }, v15));
end;
v10.didUpdate = function(v17, v18, _)
    local l_closeContextualMenu_0 = v17.props.closeContextualMenu;
    if v18.currentRoute ~= v17.props.currentRoute then
        l_closeContextualMenu_0();
    end;
end;
return (v4.connect(function(v21, _)
    return {
        formFactor = v21.FormFactor, 
        screenSize = v21.ScreenSize, 
        currentRoute = v21.Navigation.history[#v21.Navigation.history]
    };
end, function(v23)
    return {
        closeContextualMenu = function()
            v23(v9());
        end
    };
end)(v10));
