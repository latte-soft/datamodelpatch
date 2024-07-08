local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v8 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v11 = require(l_Parent_0.HumanoidViewport);
local v12 = require(l_Parent_0.ItemsList);
local v13 = require(l_Parent_1.Thunks.SignalSaveAvatarPermissionDenied);
local v14 = require(l_Parent_1.Thunks.PerformSaveAvatar);
local v15 = require(l_Parent_1.GetConformedHumanoidDescription);
local v16 = v2.PureComponent:extend("SaveAvatarPrompt");
v16.validateProps = v4.strictInterface({
    gameName = v4.string, 
    screenSize = v4.Vector2, 
    humanoidDescription = v4.instanceOf("HumanoidDescription"), 
    rigType = v4.enum(Enum.HumanoidRigType), 
    performSaveAvatar = v4.callback, 
    signalSaveAvatarPermissionDenied = v4.callback
});
v16.init = function(v17)
    v17.mounted = false;
    v17:setState({
        conformedHumanoidDescription = nil, 
        getConformedDescriptionFailed = false, 
        itemListScrollable = false
    });
    v17.middleContentRef = v2.createRef();
    local v18, v19 = v2.createBinding(UDim2.new(1, 0, 0, 200));
    v17.contentSize = v18;
    v17.updateContentSize = v19;
    v17.onAlertSizeChanged = function(v20)
        local l_AbsoluteSize_0 = v20.AbsoluteSize;
        if v17.middleContentRef:getValue() then
            local l_Y_0 = v17.middleContentRef:getValue().AbsoluteSize.Y;
            local v23 = (v17.props.screenSize.Y - 60) - (l_AbsoluteSize_0.Y - l_Y_0);
            local v24 = (v17.middleContentRef:getValue().AbsoluteSize.X / 2 - 10) + 80;
            if v24 < v23 then
                v23 = v24;
            end;
            if l_Y_0 ~= v23 then
                v17.updateContentSize(UDim2.new(1, 0, 0, v23));
            end;
            return ;
        else
            return ;
        end;
    end;
    v17.itemListScrollableUpdated = function(v25, v26)
        if v26 == v17.contentSize:getValue().Y.Offset then
            v17:setState({
                itemListScrollable = v25
            });
        end;
    end;
    v17.retryLoadDescription = function()
        v17:setState({
            getConformedDescriptionFailed = false
        });
        v17:getConformedHumanoidDescription();
    end;
    v17.renderAlertMiddleContent = function()
        local l_conformedHumanoidDescription_0 = v17.state.conformedHumanoidDescription;
        local l_getConformedDescriptionFailed_0 = v17.state.getConformedDescriptionFailed;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v17.contentSize, 
            [v2.Ref] = v17.middleContentRef
        }, {
            ItemsListFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.45, 1)
            }, {
                ItemsList = v2.createElement(v12, {
                    humanoidDescription = l_conformedHumanoidDescription_0, 
                    retryLoadDescription = v17.retryLoadDescription, 
                    loadingFailed = l_getConformedDescriptionFailed_0, 
                    itemListScrollableUpdated = v17.itemListScrollableUpdated
                })
            }), 
            HumanoidViewportFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.55, 1), 
                Position = UDim2.fromScale(0.45, 0), 
                LayoutOrder = 2
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 5), 
                    PaddingRight = UDim.new(0, 5)
                }), 
                HumanoidViewport = v2.createElement(v11, {
                    humanoidDescription = l_conformedHumanoidDescription_0, 
                    loadingFailed = l_getConformedDescriptionFailed_0, 
                    retryLoadDescription = v17.retryLoadDescription, 
                    rigType = v17.props.rigType
                })
            }), 
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = v17.contentMaxSize
            })
        });
    end;
end;
v16.render = function(v29)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptTitle"), 
        bodyText = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptText", {
            RBX_NAME = v29.props.gameName
        }), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v29.props.signalSaveAvatarPermissionDenied, 
                        text = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v29.props.performSaveAvatar, 
                        text = v8:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptYes")
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v29.props.screenSize, 
        middleContent = v29.renderAlertMiddleContent, 
        onAbsoluteSizeChanged = v29.onAlertSizeChanged, 
        isMiddleContentFocusable = v29.state.itemListScrollable
    });
end;
v16.getConformedHumanoidDescription = function(v30, v31)
    v15(v31, true):andThen(function(v32)
        if v30.mounted then
            v30:setState({
                conformedHumanoidDescription = v32
            });
            return ;
        else
            return ;
        end;
    end, function(_)
        if v30.mounted then
            v30:setState({
                getConformedDescriptionFailed = true
            });
            return ;
        else
            return ;
        end;
    end);
end;
v16.didMount = function(v34)
    v34.mounted = true;
    v34:getConformedHumanoidDescription(v34.props.humanoidDescription);
end;
v16.didUpdate = function(v35, v36, _)
    if v35.props.humanoidDescription ~= v36.humanoidDescription then
        v35:setState({
            conformedHumanoidDescription = v2.None, 
            getConformedDescriptionFailed = false
        });
        v35:getConformedHumanoidDescription(v35.props.humanoidDescription);
    end;
end;
v16.willUnmount = function(v38)
    v38.mounted = false;
end;
return v3.connect(function(v39)
    return {
        gameName = v39.gameName, 
        screenSize = v39.screenSize, 
        humanoidDescription = v39.promptInfo.humanoidDescription, 
        rigType = v39.promptInfo.rigType
    };
end, function(v40)
    return {
        signalSaveAvatarPermissionDenied = function()
            return v40(v13);
        end, 
        performSaveAvatar = function()
            return v40(v14);
        end
    };
end)(v16);
