local l_CorePackages_0 = game:GetService("CorePackages");
local l_InsertService_0 = game:GetService("InsertService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v5.Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local _ = require(l_Modules_0.LuaApp.Constants);
local v10 = require(l_Modules_0.Common.memoize);
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v12 = require(l_Modules_0.LuaApp.Components.Generic.DropdownSelector);
local v13 = require(l_Modules_0.LuaApp.Components.More.LicenseText);
local v14 = require(l_Modules_0.LuaApp.Components.More.MorePageUtils);
local l_EmptyState_0 = v5.App.Indicator.EmptyState;
local v16 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local v17 = v3.PureComponent:extend("LicensingPage");
v17.validateProps = v6.strictInterface({
    screenSize = v6.Vector2, 
    formFactor = v6.string
});
v17.getLicenseList = function()
    local l_status_0, l_result_0 = pcall(function()
        local v18 = {};
        for _, v20 in pairs(l_InsertService_0:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts"):GetChildren()) do
            local v21, v22 = v20.Name:match("^(%d*)-(.*)");
            local v23 = v20.Value:match("(.-)\n*$");
            v18[v21 + 1] = {
                key = v22, 
                value = v10(function()
                    return v23:split("\n");
                end)
            };
        end;
        return v18;
    end);
    return not not l_status_0 and l_result_0 or {};
end;
v17.init = function(v26)
    v26:setState({
        licenseList = v26.getLicenseList()
    });
end;
v17.renderWithProviders = function(v27, v28, v29)
    local l_emptyStateText_0 = v28.emptyStateText;
    local l_BackgroundDefault_0 = v29.Theme.BackgroundDefault;
    local l_licenseList_0 = v27.state.licenseList;
    local l_screenSize_0 = v27.props.screenSize;
    local v34, v35, v36 = v14.paddingsForFormFactor(v27.props.formFactor);
    local v38 = v3.createElement(v12, {
        itemList = l_licenseList_0, 
        screenSize = l_screenSize_0, 
        renderSelectedItem = function(v37)
            return v3.createElement(v13, {
                licenseTextLines = v37(), 
                contentMaxWidth = v36, 
                paddingHorizontal = v34
            });
        end, 
        contentMaxWidth = v36, 
        selectorHeight = 48, 
        selectorSpacer = 24, 
        paddingHorizontal = v34, 
        paddingVertical = v35, 
        isDisabled = #l_licenseList_0 == 0, 
        errorText = l_emptyStateText_0, 
        renderErrorItem = function()
            return v3.createElement(l_EmptyState_0, {
                text = l_emptyStateText_0
            });
        end
    });
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = l_BackgroundDefault_0.Color, 
        BackgroundTransparency = l_BackgroundDefault_0.Transparency, 
        BorderSizePixel = if not v16 then nil else 0
    }, {
        TopBar = if not v16 then v3.createElement(v11.Container, {
            leftItem = v11.BackButton, 
            rightItems = {
                v11.BuyRobuxButton, 
                v11.NotificationsButton
            }
        }) else nil, 
        LicenseSelectorFrame = if not v16 then v3.createElement(v11.PageContent, {}, {
            LicenseSelector = v38
        }) else v38
    });
end;
v17.render = function(v39)
    return v8({
        emptyStateText = "CommonUI.Messages.Message.NoLicenses"
    })(function(v40)
        return l_withStyle_0(function(v41)
            return v39:renderWithProviders(v40, v41);
        end);
    end);
end;
return (v4.connect(function(v42, _)
    return {
        screenSize = v42.ScreenSize, 
        formFactor = v42.FormFactor
    };
end)(v17));
