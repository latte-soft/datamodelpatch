local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v14 = require(l_Modules_0.AvatarExperience.Flags.FFlagUseXBoxAvatarAbuseReportingApi);
local v15 = v2.PureComponent:extend("CatalogReport");
v15.validateProps = v5.strictInterface({
    userId = v5.string, 
    itemId = v5.string, 
    itemCreatorId = v5.string, 
    itemName = v5.string, 
    itemDescription = v5.string, 
    screenSize = v5.Vector2, 
    defaultChildRef = v5.optional(v5.table), 
    focusController = v5.optional(v5.table), 
    navigation = v5.table, 
    onOverlayClosed = v5.optional(v5.callback)
});
v15.init = function(v16)
    v16.sendReport = function()
        local l_userId_0 = v16.props.userId;
        local l_itemId_0 = v16.props.itemId;
        local l_itemCreatorId_0 = v16.props.itemCreatorId;
        local l_itemName_0 = v16.props.itemName;
        local l_itemDescription_0 = v16.props.itemDescription;
        if not v14 then
            v9.ReportItem("Asset", l_itemId_0, "7", "Item reported from the Xbox App.");
        else
            v9.ReportItemV2(l_userId_0, l_itemId_0, l_itemCreatorId_0, l_itemName_0, l_itemDescription_0, "xbox-app", "xbox-catalog", "7", "Item reported from the Xbox App.");
        end;
        v16.closePrompt();
    end;
    v16.closePrompt = function()
        v12.closeOverlay(v16.props.navigation);
    end;
end;
v15.render = function(v22)
    return l_withLocalization_0({
        titleText = "Feature.Catalog.Label.ReportItem", 
        messageText = "Feature.Catalog.Message.ReportCatalogItemPhrase", 
        submitText = "Feature.Catalog.Action.Submit", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v23)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v23.titleText, 
            bodyText = v23.messageText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v22.closePrompt, 
                            text = v23.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v22.sendReport, 
                            text = v23.submitText
                        }
                    }
                }
            }, 
            screenSize = v22.props.screenSize, 
            defaultChildRef = v22.props.defaultChildRef
        });
    end);
end;
return (v11((v10((v3.connect(function(v24, _)
    return {
        screenSize = v24.ScreenSize
    };
end)(v15))))));
