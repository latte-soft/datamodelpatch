local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.mutedError);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v15 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v15.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v15.App.Button.Enum.ButtonType;
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local v19 = v2.PureComponent:extend("LeaveCatalogToAvatarPrompt");
local v20 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableLeaveCatalogToAvatarPromptOverride);
v19.init = function(v21)
    v21.openAvatarPage = function()
        local l_itemType_0 = v21.props.itemType;
        local l_itemSubType_0 = v21.props.itemSubType;
        local v24 = nil;
        local v25 = nil;
        if not v20 or not v21.props.categoryOverride then
            local v26 = v18();
            if l_itemType_0 == v12.ItemType.Asset then
                local v27 = v26.AssetTypeToCategorySubcategory[l_itemSubType_0];
                if v27 then
                    v24 = v27.category;
                    v25 = v27.subcategory;
                end;
            elseif l_itemType_0 == v12.ItemType.Bundle then
                v24 = v26.BundleToCategorySubcategory.category;
                v25 = v26.BundleToCategorySubcategory.subcategory;
            end;
        else
            v24 = v21.props.categoryOverride;
            v25 = v21.props.subcategoryOverride;
        end;
        local l_avatarAnalytics_0 = v21.props.avatarAnalytics;
        if v24 == nil then
            v5("[AvatarExperience] No category for itemType: " .. tostring(l_itemType_0) .. " / " .. tostring(l_itemSubType_0));
        else
            v21.props.setCategoryAndSubcategory(v24, v25, l_avatarAnalytics_0);
        end;
        v14.navigateFromOverlay(v21.props.navigation, v11.AvatarEditor);
        v21.props.catalogAnalytics.clickCustomizeAvatarFromItemDetailPage();
    end;
    v21.closePrompt = function()
        v14.closeOverlay(v21.props.navigation);
    end;
end;
v19.renderAlertLocalized = function(v29, v30)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v30.titleText, 
        bodyText = v30.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v29.closePrompt, 
                        text = v30.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v29.openAvatarPage, 
                        text = v30.confirmButtonText
                    }
                }
            }
        }, 
        screenSize = v29.props.screenSize, 
        defaultChildRef = v29.props.defaultChildRef
    });
end;
v19.render = function(v31)
    return l_withLocalization_0({
        titleText = "Feature.Catalog.Action.Customize", 
        messageText = "Feature.Catalog.Label.MarketplaceToAvatarPage", 
        confirmButtonText = "Feature.Catalog.Action.Customize", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v32)
        return v31:renderAlertLocalized(v32);
    end);
end;
return (v9((v10((l_RoactServices_0.connect({
    avatarAnalytics = v6, 
    catalogAnalytics = v7
})((v3.connect(function(v33, _)
    return {
        screenSize = v33.ScreenSize
    };
end, function(v35)
    return {
        setCategoryAndSubcategory = function(v36, v37, v38)
            v35(v13(v36, v37, v38));
        end
    };
end)(v19))))))));
