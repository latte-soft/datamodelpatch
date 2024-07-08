local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v8 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v8.Style.withStyle;
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_IconButton_0 = v8.App.Button.IconButton;
local v13 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v15 = require(script.Parent.Common.NameTextBox);
local v16 = require(script.Parent.AssetDescriptionTextBox);
local v17 = require(script.Parent.ObjectViewport);
local v18 = require(script.Parent.Common.PreviewViewport);
local v19 = require(script.Parent.EmoteThumbnailView);
local v20 = require(script.Parent.EmoteThumbnailEditor);
local v21 = require(script.Parent.EmoteThumbnailParameters);
local v22 = require(script.Parent.Parent.Actions.CloseOpenPrompt);
local l_Images_0 = v8.App.ImageSet.Images;
local v24 = l_Images_0["icons/actions/previewExpand"];
local v25 = l_Images_0["icons/actions/edit/edit"];
local v26 = {
    [Enum.AssetType.TShirtAccessory] = true, 
    [Enum.AssetType.ShirtAccessory] = true, 
    [Enum.AssetType.PantsAccessory] = true, 
    [Enum.AssetType.JacketAccessory] = true, 
    [Enum.AssetType.SweaterAccessory] = true, 
    [Enum.AssetType.ShortsAccessory] = true, 
    [Enum.AssetType.LeftShoeAccessory] = true, 
    [Enum.AssetType.RightShoeAccessory] = true, 
    [Enum.AssetType.DressSkirtAccessory] = true, 
    [Enum.AssetType.HairAccessory] = true
};
local v27 = require(script.Parent.Parent.GetFFlagValidateDescription);
local v28 = game:DefineFastFlag("SendConsentDeniedOnCancel", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableEmotePublish");
local v30 = v4.PureComponent:extend("PublishAssetPromptSingleStep");
v30.validateProps = v6.strictInterface({
    screenSize = v6.Vector2, 
    assetInstance = v6.Instance, 
    assetType = v6.enum(Enum.AssetType), 
    guid = v6.any, 
    scopes = v6.any, 
    closePrompt = v6.callback
});
v30.getDefaultText = function(v31)
    if v31.props.assetType == Enum.AssetType.Model then
        return v7:FormatByKey("CoreScripts.PublishAssetPrompt.PackagesDefaultName", {
            RBX_NAME = not not l_LocalPlayer_0 and l_LocalPlayer_0.Name or ""
        });
    else
        return "";
    end;
end;
v30.init = function(v32)
    v32.assetName = v32:getDefaultText();
    v32.assetDescription = v32:getDefaultText();
    v32.isNameValid = true;
    v32.isDescriptionValid = true;
    v32:setState({
        thumbnailParameters = v21.defaultParameters, 
        showingThumbnailEditor = false, 
        showingAssetPreview = false
    });
    v32.closePrompt = function()
        v32.props.closePrompt();
    end;
    v32.openThumbnailEditor = function()
        v32:setState({
            showingThumbnailEditor = true
        });
    end;
    v32.closeThumbnailEditor = function()
        v32:setState({
            showingThumbnailEditor = false
        });
    end;
    v32.openAssetPreview = function()
        v32:setState({
            showingAssetPreview = true
        });
    end;
    v32.closeAssetPreview = function()
        v32:setState({
            showingAssetPreview = false
        });
    end;
    v32.updateThumbnailParameters = function(v33)
        v32:setState({
            thumbnailParameters = v33
        });
    end;
    v32.denyAndClose = function()
        l_ExperienceAuthService_0:ScopeCheckUIComplete(v32.props.guid, v32.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {});
        v32.closePrompt();
    end;
    v32.confirmAndUpload = function()
        if v32.isNameValid then
            if not v27() or v32.isDescriptionValid then
                local v34 = {
                    assetName = v32.assetName, 
                    assetDescription = v32.assetDescription
                };
                if l_game_EngineFeature_0 and v32.props.assetType == Enum.AssetType.EmoteAnimation then
                    v34.emoteThumbnailParameters = v21.encodeAsATable(v32.state.thumbnailParameters);
                end;
                l_ExperienceAuthService_0:ScopeCheckUIComplete(v32.props.guid, v32.props.scopes, Enum.ScopeCheckResult.ConsentAccepted, v34);
                v32.closePrompt();
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v32.onAssetNameUpdated = function(v35, v36)
        if not v36 then
            v32.isNameValid = false;
            return ;
        else
            v32.assetName = v35;
            v32.isNameValid = true;
            return ;
        end;
    end;
    v32.onAssetDescriptionUpdated = function(v37, v38)
        v32.assetDescription = v37;
        v32.isDescriptionValid = v38;
    end;
    v32.nameTextBoxRef = v4.createRef();
    v32.descriptionTextBoxRef = v4.createRef();
end;
v30.renderMiddle = function(v39, v40)
    return l_withStyle_0(function(v41)
        local l_Font_0 = v41.Font;
        local l_Theme_0 = v41.Theme;
        local l_l_game_EngineFeature_0_0 = l_game_EngineFeature_0;
        if l_l_game_EngineFeature_0_0 then
            l_l_game_EngineFeature_0_0 = false;
            if v39.props.assetType == Enum.AssetType.EmoteAnimation then
                l_l_game_EngineFeature_0_0 = v39.props.assetInstance:IsA("AnimationClip");
            end;
        end;
        return v4.createElement(v13.Focusable.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 150), 
            defaultChild = v39.nameTextBoxRef, 
            [v4.Ref] = v39.middleContentRef
        }, {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MinSize = Vector2.new(200, 200)
            }), 
            TopSection = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -50), 
                BackgroundTransparency = 1
            }, {
                ViewportParent = v4.createElement("Frame", {
                    Size = UDim2.new(0.4, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    ObjectViewport = not l_l_game_EngineFeature_0_0 and v4.createElement(v17, {
                        model = v39.props.assetInstance
                    }) or nil, 
                    EmoteThumbnailParent = not not l_l_game_EngineFeature_0_0 and v4.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1
                    }, {
                        AspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1, 
                            AspectType = Enum.AspectType.FitWithinMaxSize, 
                            DominantAxis = Enum.DominantAxis.Width
                        }), 
                        EmoteThumbnailView = v4.createElement(v19, {
                            animationClip = v39.props.assetInstance, 
                            thumbnailParameters = v39.state.thumbnailParameters
                        }), 
                        PreviewButton = v4.createElement(l_IconButton_0, {
                            position = UDim2.new(1, -2, 1, -2), 
                            anchorPoint = Vector2.new(1, 1), 
                            icon = v24, 
                            size = UDim2.new(0, 30, 0, 30), 
                            showBackground = true, 
                            onActivated = v39.openAssetPreview
                        }), 
                        EditButton = v4.createElement(l_IconButton_0, {
                            position = UDim2.new(0, 2, 1, -2), 
                            anchorPoint = Vector2.new(0, 1), 
                            icon = v25, 
                            size = UDim2.new(0, 30, 0, 30), 
                            showBackground = true, 
                            onActivated = v39.openThumbnailEditor
                        })
                    }) or nil
                }), 
                NameDescriptionFields = v4.createElement("Frame", {
                    Size = UDim2.new(0.6, -10, 1, 0), 
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1
                }, {
                    NameLabel = v4.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 15), 
                        Font = l_Font_0.Body.Font, 
                        Text = v40.name, 
                        TextSize = 12, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    NameInput = v4.createElement(v15, {
                        Size = UDim2.new(1, 0, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 15), 
                        onNameUpdated = v39.onAssetNameUpdated, 
                        nameTextBoxRef = v39.nameTextBoxRef, 
                        NextSelectionDown = v39.descriptionTextBoxRef, 
                        defaultName = v39.assetName
                    }), 
                    DescriptionLabel = v4.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 15), 
                        Position = UDim2.new(0, 0, 0, 60), 
                        Font = l_Font_0.Body.Font, 
                        TextSize = 12, 
                        Text = v40.description, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    DescriptionInput = v4.createElement(v16, {
                        Size = UDim2.new(1, 0, 0, 80), 
                        Position = UDim2.new(0, 0, 0, 75), 
                        onAssetDescriptionUpdated = v39.onAssetDescriptionUpdated, 
                        descriptionTextBoxRef = v39.descriptionTextBoxRef, 
                        NextSelectionUp = v39.nameTextBoxRef, 
                        defaultDescription = v39.assetDescription
                    })
                })
            }), 
            Disclaimer = v4.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 50), 
                Text = v40.disclaimer, 
                Font = l_Font_0.Body.Font, 
                TextSize = 12, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromScale(0, 1), 
                TextWrapped = true
            })
        });
    end);
end;
v30.renderAlertLocalized = function(v45, v46)
    local v47 = v4.createElement(l_InteractiveAlert_0, {
        title = v46.title, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = if not v28 then v45.closePrompt else v45.denyAndClose, 
                        text = v46.cancel
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v45.confirmAndUpload, 
                        text = v46.submit, 
                        isDelayedInput = true, 
                        enableInputDelayed = true, 
                        delayInputSeconds = 3
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        middleContent = function()
            return v45:renderMiddle(v46);
        end, 
        screenSize = v45.props.screenSize, 
        defaultChildRef = v45.props.defaultChildRef, 
        isMiddleContentFocusable = true
    });
    if not l_game_EngineFeature_0 then
        return v47;
    else
        return v4.createFragment({
            Prompt = v47, 
            ThumbnailEditor = not not v45.state.showingThumbnailEditor and v4.createElement(v20, {
                animationClip = v45.props.assetInstance, 
                initialThumbnailParameters = v45.state.thumbnailParameters, 
                screenSize = v45.props.screenSize, 
                updateThumbnailCallback = v45.updateThumbnailParameters, 
                closePromptCallback = v45.closeThumbnailEditor
            }) or nil, 
            PreviewFrame = not not v45.state.showingAssetPreview and v4.createElement("Frame", {
                Size = UDim2.new(0.5, 0, 0.5, 0), 
                BackgroundColor3 = Color3.new(0.2, 0.2, 0.2), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 0
            }, {
                PreviewViewport = v4.createElement(v18, {
                    asset = v45.props.assetInstance, 
                    closePreviewView = v45.closeAssetPreview
                })
            }) or nil
        });
    end;
end;
local function _(v48)
    if v26[v48] == true then
        return true;
    else
        return false;
    end;
end;
local function v52(v50)
    local v51 = {
        name = v7:FormatByKey("CoreScripts.PublishAssetPrompt.Name"), 
        description = v7:FormatByKey("CoreScripts.PublishAssetPrompt.Description"), 
        invalidName = v7:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName"), 
        invalidDescription = v7:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"), 
        cancel = v7:FormatByKey("CoreScripts.PublishAssetPrompt.Cancel"), 
        submit = v7:FormatByKey("CoreScripts.PublishAssetPrompt.Submit")
    };
    if not (v26[v50] == true) then
        if v50 == Enum.AssetType.EmoteAnimation then
            v51.title = v7:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextEmote");
            v51.disclaimer = v7:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerEmote");
            return v51;
        elseif v50 == Enum.AssetType.Model then
            v51.title = v7:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextModel");
            v51.disclaimer = v7:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel");
            return v51;
        else
            if v50 == Enum.AssetType.Package then
                v51.title = v7:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextPackage");
                v51.disclaimer = v7:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel");
            end;
            return v51;
        end;
    else
        v51.title = v7:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextClothing");
        v51.disclaimer = v7:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerAvatar");
        return v51;
    end;
end;
v30.render = function(v53)
    return v53:renderAlertLocalized((v52(v53.props.assetType)));
end;
return v5.connect(function(v54)
    return {
        assetInstance = v54.promptRequest.promptInfo.assetInstance, 
        assetType = v54.promptRequest.promptInfo.assetType, 
        guid = v54.promptRequest.promptInfo.guid, 
        scopes = v54.promptRequest.promptInfo.scopes
    };
end, function(v55)
    return {
        closePrompt = function()
            return v55(v22());
        end
    };
end)(v30);
