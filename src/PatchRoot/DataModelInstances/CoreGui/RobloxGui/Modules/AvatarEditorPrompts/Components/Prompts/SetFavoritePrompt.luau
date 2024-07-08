local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local l_Parent_0 = script.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Thunks.PerformSetFavorite);
local v12 = require(l_Parent_0.Thunks.SignalSetFavoritePermissionDenied);
local v13 = v2.PureComponent:extend("SetFavoritePrompt");
v13.validateProps = v4.strictInterface({
    itemId = v4.integer, 
    itemType = v4.enum(Enum.AvatarItemType), 
    itemName = v4.string, 
    shouldFavorite = v4.boolean, 
    screenSize = v4.Vector2, 
    performSetFavorite = v4.callback, 
    signalSetFavoritePermissionDenied = v4.callback
});
v13.init = function(v14)
    v14.renderAlertMiddleContent = function()
        local v15 = nil;
        if v14.props.itemType == Enum.AvatarItemType.Asset then
            v15 = "Asset";
        elseif v14.props.itemType == Enum.AvatarItemType.Bundle then
            v15 = "BundleThumbnail";
        end;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 150)
        }, {
            Thumnail = v2.createElement(l_LoadableImage_0, {
                Position = UDim2.fromScale(0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.fromOffset(150, 150), 
                BackgroundTransparency = 1, 
                Image = "rbxthumb://type=" .. v15 .. "&id=" .. v14.props.itemId .. "&w=150&h=150", 
                useShimmerAnimationWhileLoading = true, 
                showFailedStateWhenLoadingFailed = true
            })
        });
    end;
end;
v13.render = function(v16)
    local v17 = nil;
    local v18 = nil;
    if not v16.props.shouldFavorite then
        v17 = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptTitle");
        v18 = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptText", {
            RBX_NAME = v16.props.itemName
        });
    else
        v17 = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptTitle");
        v18 = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptText", {
            RBX_NAME = v16.props.itemName
        });
    end;
    return v2.createElement(l_InteractiveAlert_0, {
        title = v17, 
        bodyText = v18, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v16.props.signalSetFavoritePermissionDenied, 
                        text = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v16.props.performSetFavorite, 
                        text = v6:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v16.props.screenSize, 
        middleContent = v16.renderAlertMiddleContent, 
        isMiddleContentFocusable = false
    });
end;
return v3.connect(function(v19)
    return {
        itemId = v19.promptInfo.itemId, 
        itemType = v19.promptInfo.itemType, 
        itemName = v19.promptInfo.itemName, 
        shouldFavorite = v19.promptInfo.shouldFavorite, 
        screenSize = v19.screenSize
    };
end, function(v20)
    return {
        performSetFavorite = function()
            return v20(v11);
        end, 
        signalSetFavoritePermissionDenied = function()
            return v20(v12);
        end
    };
end)(v13);
