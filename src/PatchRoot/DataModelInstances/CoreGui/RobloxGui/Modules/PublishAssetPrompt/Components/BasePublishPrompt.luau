local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_Players_0 = game:GetService("Players");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local v8 = require(l_CorePackages_0.Roact);
local v9 = require(l_CorePackages_0.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.t);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v13 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v13.Style.withStyle;
local l_FullPageModal_0 = v13.App.Dialog.Modal.FullPageModal;
local l_Overlay_0 = v13.App.Dialog.Overlay;
local l_ButtonType_0 = v13.App.Button.Enum.ButtonType;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local v19 = require(l_RobloxGui_0.Modules.Common.httpRequest)(l_HttpRbxApiService_0);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local v23 = require(l_Parent_0.Common.NameTextBox);
local v24 = require(script.Parent.Parent.Actions.CloseOpenPrompt);
local l_ItemInfoList_0 = require(l_CorePackages_0.Workspace.Packages.ItemDetails).ItemInfoList;
local v26 = require(script.Parent.LeaveCreationAlert);
local v27 = require(script.Parent.Parent.Constants);
local v28 = require(l_Parent_0.Common.PreviewViewport);
local v29 = require(l_Parent_0.ValidationErrorModal);
local v30 = v8.PureComponent:extend("BasePublishPrompt");
local v31 = UDim.new(1.5, 0);
v30.validateProps = v10.strictInterface({
    screenSize = v10.Vector2, 
    nameLabel = v10.string, 
    defaultName = v10.string, 
    promptBody = v10.any, 
    typeData = v10.string, 
    titleText = v10.string, 
    showingPreviewView = v10.boolean, 
    closePreviewView = v10.callback, 
    asset = v10.union(v10.instanceOf("Model"), v10.instanceIsA("AnimationClip")), 
    onNameUpdated = v10.callback, 
    canSubmit = v10.callback, 
    onSubmit = v10.callback, 
    enableInputDelayed = v10.optional(v10.boolean), 
    isDelayedInput = v10.optional(v10.boolean), 
    delayInputSeconds = v10.optional(v10.number), 
    guid = v10.any, 
    scopes = v10.any, 
    errorMessage = v10.optional(v10.string), 
    closePrompt = v10.callback
});
v30.init = function(v32)
    v32.isMounted = false;
    v32.swipeScrollingFrameRef = v8.createRef();
    v32.inputState = nil;
    v32.inputObject = nil;
    v32.connection = nil;
    v32.storeInput = function(_, v34, v35)
        v32.inputState = v34;
        v32.inputObject = v35;
        return Enum.ContextActionResult.Sink;
    end;
    v32:setState({
        showUnsavedDataWarning = false
    });
    v32.closePrompt = function()
        v32.props.closePrompt();
    end;
    v32.showUnsavedDataWarning = function()
        v32:setState({
            showUnsavedDataWarning = true
        });
    end;
    v32.cancelClosePrompt = function()
        v32:setState({
            showUnsavedDataWarning = false
        });
    end;
    v32.denyAndClose = function()
        l_ExperienceAuthService_0:ScopeCheckUIComplete(v32.props.guid, v32.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {});
        v32.closePrompt();
    end;
    v32.confirmAndUpload = function()
        if v32.props.canSubmit() then
            v32.props.onSubmit();
            v32.closePrompt();
        end;
    end;
end;
v30.setUpGamepad = function(v36)
    if l_UserInputService_0.GamepadEnabled then
        l_ContextActionService_0:UnbindCoreAction("ScrollPrompt");
        l_ContextActionService_0:BindCoreAction("ScrollPrompt", v36.storeInput, false, Enum.KeyCode.Thumbstick2);
        v36.connection = l_RunService_0.RenderStepped:Connect(function(v37)
            if not (not (v36.inputState == Enum.UserInputState.Change) or not v36.inputObject) then
                local l_Position_0 = v36.inputObject.Position;
                local l_current_0 = v36.swipeScrollingFrameRef.current;
                local v40 = l_current_0.CanvasPosition.Y + (v37 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y) * 1000;
                if v40 <= l_current_0.AbsoluteSize.Y * v31.Scale + v31.Offset then
                    l_current_0.CanvasPosition = Vector2.new(0, v40);
                end;
            end;
        end);
        l_ContextActionService_0:UnbindCoreAction("ClosePrompt");
        l_ContextActionService_0:BindCoreAction("ClosePrompt", v36.storeInput, false, Enum.KeyCode.ButtonB);
    end;
end;
v30.cleanupGamepad = function(v41)
    l_ContextActionService_0:UnbindCoreAction("ClosePrompt");
    l_ContextActionService_0:UnbindCoreAction("ScrollPrompt");
    if v41.connection then
        v41.connection:Disconnect();
    end;
end;
v30.didMount = function(v42)
    v42.isMounted = true;
    v42:setUpGamepad();
    l_GetGameNameAndDescription_0(v19, game.GameId):andThen(function(v43)
        if not (not v42.isMounted or not v43.Name) then
            v42:setState({
                gameName = v43.Name
            });
        end;
    end);
end;
v30.renderMiddle = function(v44, v45)
    return l_withStyle_0(function(v46)
        local l_Font_0 = v46.Font;
        local v48 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
        local l_Theme_0 = v46.Theme;
        assert(l_LocalPlayer_0, "Assert LocalPlayer not nil to silence type checker");
        local l_Name_0 = l_LocalPlayer_0.Name;
        local l_gameName_0 = v44.state.gameName;
        local l_typeData_0 = v44.props.typeData;
        return v8.createFragment({
            ScrollingFrame = v8.createElement("ScrollingFrame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -50), 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                Selectable = false, 
                [v8.Ref] = v44.swipeScrollingFrameRef
            }, {
                layout = v8.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                padding = v8.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v27.PromptSidePadding), 
                    PaddingRight = UDim.new(0, v27.PromptSidePadding)
                }), 
                NameLabel = v8.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 39), 
                    Font = l_Font_0.Body.Font, 
                    Text = v44.props.nameLabel, 
                    TextSize = v48, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }, {
                    Padding = v8.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24)
                    })
                }), 
                NameInput = v8.createElement(v23, {
                    Size = UDim2.new(1, 0, 0, 30), 
                    onNameUpdated = v44.props.onNameUpdated, 
                    defaultName = v44.props.defaultName, 
                    LayoutOrder = 2
                }), 
                PromptBody = v8.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, v44.props.promptBody), 
                PromptRows = v8.createElement(l_ItemInfoList_0, {
                    rowData = {
                        {
                            infoName = v45.creator, 
                            infoData = l_Name_0, 
                            hasVerifiedBadge = l_LocalPlayer_0.HasVerifiedBadge, 
                            isLoading = l_Name_0 == nil, 
                            Selectable = false
                        }, 
                        {
                            infoName = v45.madeIn, 
                            infoData = l_gameName_0, 
                            isLoading = l_gameName_0 == nil, 
                            Selectable = false
                        }, 
                        {
                            infoName = v45.type, 
                            infoData = l_typeData_0, 
                            isLoading = l_typeData_0 == nil, 
                            Selectable = false
                        }
                    }, 
                    LayoutOrder = 4
                })
            }), 
            BottomGradient = v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 5), 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, -50), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                gradient = v8.createElement("UIGradient", {
                    Rotation = 270, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundUIDefault.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, l_Theme_0.BackgroundUIDefault.Transparency), 
                        NumberSequenceKeypoint.new(0.5, l_Theme_0.BackgroundUIDefault.Transparency), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            }), 
            DisclaimerContainer = v8.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 50), 
                Position = UDim2.new(0, 0, 1, -50)
            }, {
                padding = v8.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v27.PromptSidePadding), 
                    PaddingRight = UDim.new(0, v27.PromptSidePadding)
                }), 
                Disclaimer = v8.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    Text = v45.disclaimer, 
                    Font = l_Font_0.Body.Font, 
                    TextSize = v48, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    BackgroundTransparency = 1, 
                    TextWrapped = true
                })
            })
        });
    end);
end;
v30.renderAlertLocalized = function(v53, v54)
    return l_withStyle_0(function(v55)
        local l_Theme_1 = v55.Theme;
        return v8.createFragment({
            Overlay = v8.createElement(l_Overlay_0, {
                showGradient = false, 
                ZIndex = -1
            }), 
            PublishPrompt = v8.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Visible = not v53.state.showUnsavedDataWarning and not v53.props.showingPreviewView
            }, {
                FullPageModal = v8.createElement(l_FullPageModal_0, {
                    title = v53.props.titleText, 
                    onCloseClicked = v53.showUnsavedDataWarning, 
                    distanceFromTop = 37, 
                    marginSize = 0, 
                    screenSize = v53.props.screenSize, 
                    buttonStackProps = {
                        buttons = {
                            {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                props = {
                                    isDisabled = not v53.props.canSubmit(), 
                                    isDelayedInput = v53.props.isDelayedInput, 
                                    enableInputDelayed = v53.props.enableInputDelayed, 
                                    delayInputSeconds = v53.props.delayInputSeconds, 
                                    onActivated = v53.confirmAndUpload, 
                                    text = v54.submit
                                }
                            }
                        }, 
                        disableRoactGamepadButtonSelection = true
                    }
                }, {
                    middleContent = v53:renderMiddle(v54)
                })
            }), 
            LeaveCreationAlert = if not v53.state.showUnsavedDataWarning then nil else v8.createElement(v26, {
                screenSize = v53.props.screenSize, 
                closePrompt = v53.denyAndClose, 
                cancelClosePrompt = v53.cancelClosePrompt
            }), 
            ValidationErrorAlert = if not v53.props.errorMessage then nil else v8.createElement(v29, {
                screenSize = v53.props.screenSize, 
                closePrompt = v53.closePrompt
            }), 
            PreviewFrame = not not v53.props.showingPreviewView and v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = l_Theme_1.BackgroundUIDefault.Transparency
            }, {
                PreviewViewport = v8.createElement(v28, {
                    asset = v53.props.asset, 
                    closePreviewView = v53.props.closePreviewView
                })
            }) or nil
        });
    end);
end;
local function v57()
    return {
        submit = v12:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"), 
        creator = v12:FormatByKey("Feature.Catalog.Label.Filter.Creator"), 
        type = v12:FormatByKey("Feature.Catalog.Label.CategoryType"), 
        madeIn = v12:FormatByKey("Feature.Catalog.Label.Attribution"), 
        disclaimer = v12:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
    };
end;
v30.render = function(v58)
    return v58:renderAlertLocalized((v57()));
end;
v30.willUnmount = function(v59)
    v59:cleanupGamepad();
    v59.isMounted = false;
end;
return v9.connect(function(v60)
    return {
        guid = v60.promptRequest.promptInfo.guid, 
        scopes = v60.promptRequest.promptInfo.scopes, 
        errorMessage = v60.promptRequest.promptInfo.errorMessage
    };
end, function(v61)
    return {
        closePrompt = function()
            return v61(v24());
        end
    };
end)(v30);
