local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.RoactNavigation);
local v9 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_withStyle_0 = v9.Style.withStyle;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_IconSize_0 = v9.App.ImageSet.Enum.IconSize;
local _ = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local v15 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.getIconButtonSize);
local _ = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local _ = require(l_Modules_0.LuaApp.AppPage);
local _ = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local _ = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience);
local _ = require(l_Modules_0.LuaApp.Components.NumericalBadge);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local _ = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v23 = l_Images_0["icons/common/search"];
local v24 = v6.PureComponent:extend("SearchButton");
v24.validateProps = v5.strictInterface({
    formFactor = v5.string, 
    isCompactView = v5.boolean, 
    isUnderTitleSearchBarEnabled = v5.boolean, 
    isSearching = v5.boolean, 
    isSecondary = v5.optional(v5.boolean), 
    setVisible = v4.isCallable, 
    cancelSearch = v4.isCallable, 
    activateSearch = v4.isCallable, 
    buttonRef = v5.optional(v5.table), 
    enableSearch = v5.boolean
});
local function _(v25)
    return (v25.enableSearch and v25.isCompactView) and not v25.isUnderTitleSearchBarEnabled;
end;
v24.updateVisibility = function(v27, v28)
    local l_props_0 = v27.props;
    local v30 = (l_props_0.enableSearch and l_props_0.isCompactView) and not l_props_0.isUnderTitleSearchBarEnabled;
    if v30 ~= v28 then
        v27.props.setVisible(v30);
    end;
end;
v24.didMount = function(v31)
    v31:updateVisibility(nil);
end;
v24.didUpdate = function(v32, v33, _)
    v32:updateVisibility((v33.enableSearch and v33.isCompactView) and not v33.isUnderTitleSearchBarEnabled);
end;
v24.render = function(v35)
    return l_withStyle_0(function(v36)
        return v6.createElement(l_IconButton_0, {
            size = UDim2.new(0, v15(v35.props.formFactor), 1, 0), 
            layoutOrder = 3, 
            icon = v23, 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = v36.Theme.SystemPrimaryDefault.Color, 
            iconTransparency = v36.Theme.SystemPrimaryDefault.Transparency, 
            onActivated = v35.props.activateSearch, 
            buttonRef = v35.props.buttonRef
        });
    end);
end;
return (l_RoactAppPolicy_0.connect(function(v37, _)
    return {
        enableSearch = v37.getSearchBar()
    };
end)(v24));
