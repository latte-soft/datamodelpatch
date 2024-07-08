local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(l_Modules_0.LuaApp.FitChildren);
local v8 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_FitFrameHorizontal_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local _ = require(l_CorePackages_0.Workspace.Packages.Localization).RobloxLocaleIdKey;
local l_Pillv2_0 = v4.App.Control.Pillv2;
local v13 = require(l_Modules_0.LuaApp.Enum.InputValidity);
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_Modules_0.LuaApp.Thunks.Authentication.UsernameSuggestor);
local _ = require(l_Modules_0.LuaApp.Enum.UsernameIssue);
local _ = require(l_Modules_0.LuaApp.Enum.IssueCondition);
local v19 = require(l_Modules_0.LuaApp.Components.Authentication.RefreshButton);
local v20 = require(l_CorePackages_0.Packages.t);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = v20.interface({
    suggestUsernames = v20.callback
});
local v23 = v3.PureComponent:extend("SuggestionsFrame");
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagUsernameSuggestionRefreshButtonEnabled);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSuggestionRefreshLoadingAnimation);
local v26 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUsernameSuggestionBorder);
v23.init = function(v27)
    v27.state = {
        showSuggestions = v27.props.showSuggestions or false, 
        didGenerate = false, 
        currentSuggestions = v27.props.prefilledSuggestions or {}, 
        lastUsernameInput = ""
    };
    v27.isMounted = false;
    v27.usernameSuggestionsShown = v27.props.usernameSuggestionsShown;
    v27.suggestUsername = function(v28)
        v27.props.suggest.suggestUsernames(v27.props.networking, v28, v27.props.birthday, v27.props.context):andThen(function(v29)
            if v29.shouldUpdateState then
                v27:setState({
                    didGenerate = v29.didGenerate, 
                    currentSuggestions = v29.suggestions
                });
            end;
        end);
    end;
    v27.refreshSuggestions = function(v30)
        v27.props.suggest.suggestUsernames(v27.props.networking, v30, v27.props.birthday, v27.props.context):andThen(function(v31)
            if not (not v31.shouldUpdateState or not v31.didGenerate) then
                v27:setState({
                    didGenerate = v31.didGenerate, 
                    currentSuggestions = v31.suggestions
                });
            end;
        end);
    end;
    v27.suggestionsToString = function(v32)
        return table.concat(v32, ",");
    end;
    v27.shouldSuggest = v27.props.shouldSuggest;
    v27.loadSuggestions = v27.props.loadSuggestions;
    v27.finishSuggestions = v27.props.finishSuggestions;
end;
v23.didMount = function(v33)
    v33.isMounted = true;
end;
v23.didUpdate = function(v34, _, _)
    if v34.isMounted then
        local v37 = v34.props.textBoxRef:getValue();
        if v37.Text ~= "" and v34.props.prefilledSuggestions ~= v34.state.currentSuggestions then
            if v34.props.usernameValid == v13.Invalid then
                if not (not (v37.Text ~= v34.state.lastUsernameInput) or not v34.shouldSuggest()) then
                    v34.suggestUsername(v37.Text);
                end;
                v34:setState({
                    lastUsernameInput = v37.Text
                });
            else
                v34:setState({
                    didGenerate = false, 
                    lastUsernameInput = ""
                });
            end;
            v34:setState({
                showSuggestions = v34.state.didGenerate
            });
            if not (not v34.state.showSuggestions or not v34.usernameSuggestionsShown) then
                v34.usernameSuggestionsShown(v37.Text, v34.suggestionsToString(v34.state.currentSuggestions));
            end;
        end;
    end;
end;
suggestionPill = function(v38, v39, v40, v41, v42, v43)
    local v47 = {
        text = v38, 
        onStateChanged = function(_, v45)
            if v45 == l_ControlState_0.Pressed then
                if v40 then
                    v40();
                end;
                local v46 = v39:getValue();
                if v41 then
                    v41(v46.Text, v38);
                end;
                v46.Text = v38;
                v42(v45);
            end;
        end, 
        onActivated = function()
        end, 
        isLoading = not not v25() and (v43 or false)
    };
    if v26() then
        v47.hasBorder = true;
    end;
    return v3.createElement(l_Focusable_0[l_Pillv2_0], v47);
end;
getPills = function(v48, v49, v50, v51, v52, v53)
    local v54 = {};
    for _, v56 in pairs(v48) do
        v54[v56] = suggestionPill(v56, v49, v50, v51, v52, v53);
    end;
    return v54;
end;
suggestionPillWithLayout = function(v57, v58, v59, v60, v61, v62, v63, v64)
    local l_CaptionHeader_0 = v63.Font.CaptionHeader;
    local l_X_0 = l_TextService_0:GetTextSize(v57, l_CaptionHeader_0.RelativeSize * v63.Font.BaseSize, l_CaptionHeader_0.Font, Vector2.new()).X;
    local v70 = {
        text = v57, 
        onStateChanged = function(_, v68)
            if v68 == l_ControlState_0.Pressed then
                if v59 then
                    v59();
                end;
                local v69 = v58:getValue();
                if v60 then
                    v60(v69.Text, v57);
                end;
                v69.Text = v57;
                v61(v68);
            end;
        end, 
        onActivated = function()
        end, 
        isLoading = v62
    };
    if v26() then
        v70.hasBorder = true;
    end;
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        layoutOrder = v64
    }, {
        sizeConstraint = v3.createElement("UISizeConstraint", {
            MinSize = Vector2.new(l_X_0 + 26, 28)
        }), 
        pill = v3.createElement(l_Focusable_0[l_Pillv2_0], v70)
    });
end;
_getPillsWithLayout = function(v71, v72, v73, v74, v75, v76, v77)
    local v78 = {
        [0] = v3.createElement("UIGridLayout", {
            CellSize = UDim2.new(0, 0, 0, 1), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            StartCorner = 0, 
            FillDirectionMaxCells = 0, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        [1] = v3.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 1), 
            PaddingBottom = UDim.new(0, 1)
        })
    };
    for v79 in v71, nil, nil do
        table.insert(suggestionPillWithLayout(v71[v79], v72, v73, v74, v75, v76, v77, v79 + 2));
    end;
    return v78;
end;
v23.render = function(v80)
    if v80.isMounted and v80.props.textBoxRef:getValue().Text ~= v80.state.lastUsernameInput then
        v80:setState({
            showSuggestions = false
        });
    end;
    return l_withStyle_0(function(v81)
        return v6({
            tryText = "Authentication.SignUp.Description.Try"
        })(function(v82)
            local l_CaptionHeader_1 = v81.Font.CaptionHeader;
            local v84 = v81.Font.BaseSize * v81.Font.CaptionHeader.RelativeSize;
            return v80.state.showSuggestions and v3.createElement(v7.FitFrame, {
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = v80.props.layoutOrder, 
                fitAxis = v7.FitAxis.Height, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                BackgroundColor3 = v81.Theme.BackgroundUIDefault.Color, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 6), 
                    PaddingBottom = UDim.new(0, 2)
                }), 
                Title = v3.createElement(v8, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v7.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = v82.tryText .. ":", 
                    TextWrapped = true, 
                    Font = l_CaptionHeader_1.Font, 
                    TextSize = v84, 
                    TextColor3 = v81.Theme.TextEmphasis.Color, 
                    TextTransparency = v81.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                SuggestionButtons = v3.createElement(l_FitFrameHorizontal_0, {
                    Position = UDim2.new(0, l_TextService_0:GetTextSize(v82.tryText, v84, l_CaptionHeader_1.Font, Vector2.new()).X + 12, 0, -6), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    contentPadding = UDim.new(0, 6), 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, getPills(v80.state.currentSuggestions, v80.props.textBoxRef, v80.props.updatePillClicked, v80.props.usernameSuggestionClicked, v80.props.updateSuggestionControlState, v80.props.loadingSuggestions)), 
                RefreshButtonFrame = (v24() and v80.props.useRefreshButton) and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right
                    }), 
                    RefreshButton = v3.createElement(v19, {
                        onRefresh = function()
                            v80.props.logRefreshButtonClicked();
                            v80.refreshSuggestions(v80.props.textBoxRef:getValue().Text);
                        end, 
                        loadSuggestions = v80.loadSuggestions, 
                        finishSuggestions = v80.finishSuggestions
                    })
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    networking = v15
})(v23));
