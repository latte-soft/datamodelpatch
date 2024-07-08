local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local v8 = require(l_CorePackages_0.Packages.t);
local l_Images_0 = v2.App.ImageSet.Images;
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local v12 = l_Images_0["icons/common/robux"];
local v13 = v3.PureComponent:extend("PassFooter");
v13.validateProps = v8.strictInterface({
    price = v8.number, 
    userOwnsPass = v8.boolean, 
    onActivated = v8.callback, 
    localization = v8.table
});
v13.render = function(v14)
    local l_localization_0 = v14.props.localization;
    local l_price_0 = v14.props.price;
    local l_userOwnsPass_0 = v14.props.userOwnsPass;
    return v7({
        owned = "Feature.Catalog.Label.Owned"
    })(function(v18)
        local _ = nil;
        return v3.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            size = UDim2.new(1, 0, 0, 35), 
            icon = if l_userOwnsPass_0 then nil else v12, 
            text = if not l_userOwnsPass_0 then l_NumberLocalization_0.abbreviate(l_price_0, l_localization_0:GetLocale()) else v18.owned, 
            isDisabled = l_userOwnsPass_0, 
            onActivated = v14.props.onActivated
        });
    end);
end;
return (l_RoactServices_0.connect({
    localization = v5
})(v13));
