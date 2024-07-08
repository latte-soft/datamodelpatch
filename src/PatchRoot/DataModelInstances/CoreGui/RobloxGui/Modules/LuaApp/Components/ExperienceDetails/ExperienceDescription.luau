local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.UIBlox);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_LoadingStateContainer_0 = v3.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v3.App.Loading.Enum.RetrievalStatus;
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsPanel);
local v15 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppExperienceDescriptionPanel);
local v17 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
if not v16() then
    local v18 = v1.PureComponent:extend("ExperienceDescription");
    v18.validateProps = v2.strictInterface({
        dataStatus = l_RetrievalStatus_0.isEnumValue, 
        descriptionText = v2.optional(v2.string), 
        onFocusChanged = v2.optional(v2.callback)
    });
    v18.renderContent = function(v19)
        if not (v19.props.descriptionText ~= nil) or v19.props.descriptionText == "" then
            return nil;
        else
            return l_withLocalization_0({
                DescriptionTitle = "Feature.ExperienceDetails.Body.DescriptionTitle"
            })(function(v20)
                return l_withStyle_0(function(v21)
                    return v1.createElement("Frame", {
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, {
                        UIListLayout = v1.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 24)
                        }), 
                        Title = v1.createElement(l_StyledTextLabel_0, {
                            text = v20.DescriptionTitle, 
                            size = UDim2.fromScale(1, 0), 
                            fontStyle = v21.Font.Header1, 
                            colorStyle = v21.Theme.TextEmphasis, 
                            automaticSize = Enum.AutomaticSize.Y, 
                            richText = false, 
                            fluidSizing = false
                        }), 
                        Description = v1.createElement(l_StyledTextLabel_0, {
                            text = v19.props.descriptionText, 
                            size = UDim2.fromScale(1, 0), 
                            fontStyle = v21.Font.Body, 
                            colorStyle = v21.Theme.TextDefault, 
                            automaticSize = Enum.AutomaticSize.Y, 
                            richText = false, 
                            fluidSizing = false
                        })
                    });
                end);
            end);
        end;
    end;
    v18.render = function(v22)
        return v1.createElement(l_LoadingStateContainer_0, {
            dataStatus = v22.props.dataStatus, 
            renderOnFailed = function()
                return nil;
            end, 
            renderOnLoaded = function()
                return v22:renderContent();
            end
        });
    end;
    return v18;
else
    return function(v23)
        local v24 = l_useStyle_0();
        local v25 = l_useLocalization_0({
            DescriptionTitle = "Feature.ExperienceDetails.Body.DescriptionTitle"
        });
        local v27 = v15(function(v26)
            return v26.enableExperienceDetailsPanel();
        end);
        local v29 = l_useDesignTokens_0(function(v28)
            if not v28 then
                return 1;
            else
                return v28.LuaApps.ExperienceDetails.PanelWidthScale;
            end;
        end);
        local v31 = l_useDesignTokens_0(function(v30)
            if not v30 then
                return 0;
            else
                return v30.LuaApps.ExperienceDetails.PanelInnerPadding;
            end;
        end);
        local v32 = v23.dataStatus == l_RetrievalStatus_0.Done;
        local v33 = v23.descriptionText and #v23.descriptionText > 0;
        local v35 = l_useDesignTokens_0(function(v34)
            return v34.Semantic.Typography.Body;
        end);
        local v37 = l_useDesignTokens_0(function(v36)
            return v36.Semantic.Typography.Header;
        end);
        local v38 = nil;
        local v39 = nil;
        local l_LineHeight_0 = v35.LineHeight;
        if not v17 then
            v38 = v24.Font.BaseSize * v24.Font.Body.RelativeSize;
            v39 = v24.Font.Body.Font;
        else
            v38 = v35.FontSize;
            v39 = v35.Font;
        end;
        local v41, v42 = v1.useState(0);
        local v43 = v41 * v29;
        local v44 = v1.useMemo(function()
            if not v33 or not v27 then
                return 0;
            else
                return l_GetTextSize_0(v23.descriptionText, v38, v39, Vector2.new(v43, math.huge)).Y * l_LineHeight_0;
            end;
        end, {
            v23.descriptionText, 
            v38, 
            v39, 
            v43, 
            v27, 
            l_LineHeight_0
        });
        local v45 = v1.useRef(nil);
        v1.useEffect(function()
            if v45.current then
                v42(v45.current.AbsoluteSize.X);
            end;
        end);
        if not v32 or not v33 then
            return nil;
        else
            local v47 = v1.createElement("Frame", {
                ref = v45, 
                [v1.Change.AbsoluteSize] = function(v46)
                    v42(v46.AbsoluteSize.X);
                end, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Padding = if not v27 then nil else v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v31), 
                    PaddingTop = UDim.new(0, v31), 
                    PaddingRight = UDim.new(0, v31), 
                    PaddingBottom = UDim.new(0, v31)
                }), 
                UIListLayout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 24)
                }), 
                Title = if not v27 then v1.createElement(l_StyledTextLabel_0, {
                    text = v25.DescriptionTitle, 
                    size = UDim2.fromScale(1, 0), 
                    fontStyle = if not v17 then v24.Font.Header1 else v37, 
                    colorStyle = v24.Theme.TextEmphasis, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    richText = false, 
                    fluidSizing = false
                }) else nil, 
                Description = v1.createElement(l_StyledTextLabel_0, {
                    text = v23.descriptionText, 
                    size = UDim2.new(v29, 0, 0, v44), 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    fontStyle = if not v17 then v24.Font.Body else v35, 
                    colorStyle = v24.Theme.TextDefault, 
                    automaticSize = if not v27 then Enum.AutomaticSize.Y else nil, 
                    lineHeight = l_LineHeight_0, 
                    richText = false, 
                    fluidSizing = false
                })
            });
            if not v27 then
                return v47;
            else
                return v1.createElement(v14, {
                    title = v25.DescriptionTitle, 
                    onFocusChanged = v23.onFocusChanged
                }, v47);
            end;
        end;
    end;
end;
