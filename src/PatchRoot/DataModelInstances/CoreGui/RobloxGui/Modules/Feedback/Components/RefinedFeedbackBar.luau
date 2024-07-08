local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local v3 = require(script.Parent.Parent.Thunks.ShowHelpModalThunk);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v5 = require(script.Parent.FeedbackBarHint);
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.UIBlox);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.Cryo);
local l_withStyle_0 = v8.Core.Style.withStyle;
local l_ButtonStack_0 = v8.App.Button.ButtonStack;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v14 = v6.PureComponent:extend("RefinedFeedbackBar");
local function v15(...)
    return l_TextService_0:GetTextSize(...) + Vector2.new(2, 2);
end;
v14.validateProps = v9.strictInterface({
    leftHint = v9.strictInterface({
        text = v9.string
    })
});
v14.init = function(v16)
    v16.state = {
        barWidth = 0, 
        hintStringsConcat = nil, 
        requiredSpace = nil, 
        hintRatios = nil
    };
    v16.onExitFeedbackMode = function()
        l_ExperienceStateCaptureService_0:ToggleCaptureMode();
    end;
    v16.openHelpModal = function()
        v16.props.showHelpModal(true);
    end;
end;
v14.calculateHintRatios = function(v17)
    local v18 = 84;
    local v19 = "";
    local v20 = {};
    local v21 = 0;
    local v22 = v10.List.join({
        v17
    }, {});
    for _, v24 in ipairs(v22) do
        v20[v24.text] = v15(v24.text, 17, 2, Vector2.new(10000, 10000)).X;
        v21 = v21 + v20[v24.text];
        v18 = (v18 + 36) + 8;
        v19 = v19 .. v24.text;
    end;
    for v25, v26 in pairs(v20) do
        v20[v25] = v26 / v21;
    end;
    return v20, v18 + math.max(#v22 - 2, 0) * 40, v19;
end;
v14.getDerivedStateFromProps = function(v27)
    local v28, v29, v30 = v14.calculateHintRatios(v27.leftHint);
    return {
        hintRatios = v28, 
        requiredSpace = v29, 
        hintStringsConcat = v30
    };
end;
v14.calculateHintSize = function(v31, v32, v33)
    local v34 = v32 - v31.state.requiredSpace;
    local v35 = v33.Header2.RelativeSize * v33.BaseSize;
    local v36 = v33.Header2.RelativeMinSize * v33.BaseSize;
    local l_X_0 = v15(v31.state.hintStringsConcat, v36, v33.Header2.Font, Vector2.new(10000, 10000)).X;
    if l_X_0 <= v34 then
        local l_X_1 = v15(v31.state.hintStringsConcat, v35, v33.Header2.Font, Vector2.new(10000, 10000)).X;
        local v39 = (v35 - v36) / (l_X_1 - l_X_0);
        return nil, (math.clamp(v34 * v39 + (v35 - v39 * l_X_1), v36, v35));
    else
        local v40 = {};
        for v41, v42 in pairs(v31.state.hintRatios) do
            v40[v41] = v42 * v34;
        end;
        return v40;
    end;
end;
v14.render = function(v43)
    return l_withStyle_0(function(v44)
        local l_Theme_0 = v44.Theme;
        return v6.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
            Size = UDim2.new(1, 0, 0, 72), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            [v6.Change.AbsoluteSize] = function(v46)
                v43:setState({
                    barWidth = v46.AbsoluteSize.X
                });
            end, 
            [v6.Event.AncestryChanged] = function(v47)
                v43:setState({
                    barWidth = v47.AbsoluteSize.X
                });
            end
        }, {
            Padding = v6.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            LeftFrame = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.5, 1)
            }, {
                v6.createElement("UIListLayout", {
                    key = "Layout", 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 40)
                }), 
                (function(v48)
                    return v6.createElement(v5, v48);
                end)(v43.props.leftHint)
            }), 
            RightFrame = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.35, 1), 
                Position = UDim2.fromScale(1, 0), 
                AnchorPoint = Vector2.new(1, 0)
            }, {
                Layout = v6.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 40)
                }), 
                Buttons = l_withLocalization_0({
                    helpButtonText = "CoreScripts.Feedback.FeedbackBar.HelpButton", 
                    exitFeedbackButtonText = "CoreScripts.Feedback.FeedbackBar.ExitFeedbackButton"
                })(function(v49)
                    return v6.createElement(l_ButtonStack_0, {
                        buttonHeight = 50, 
                        buttons = {
                            {
                                buttonType = l_ButtonType_0.Secondary, 
                                props = {
                                    onActivated = v43.openHelpModal, 
                                    text = v49.helpButtonText
                                }
                            }, 
                            {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                props = {
                                    isDisabled = false, 
                                    onActivated = v43.onExitFeedbackMode, 
                                    text = v49.exitFeedbackButtonText
                                }
                            }
                        }, 
                        forcedFillDirection = Enum.FillDirection.Horizontal
                    });
                end)
            })
        });
    end);
end;
return v7.connect(function()
    return {};
end, function(v50)
    return {
        showHelpModal = function(v51)
            v50(v3(v51));
        end
    };
end)(v14);
