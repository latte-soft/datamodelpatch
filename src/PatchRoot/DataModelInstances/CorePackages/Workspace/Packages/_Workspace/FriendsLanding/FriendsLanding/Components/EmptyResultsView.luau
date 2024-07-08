local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_withLocalization_0 = v2.withLocalization;
local l_UIBlox_0 = v2.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v9 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v10 = require(l_script_FirstAncestor_0.Common.Constants);
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagFriendsLandingNewEmptyPage);
local v13 = l_Roact_0.PureComponent:extend("EmptyResultsView");
v13.defaultProps = {
    layoutOrder = 0, 
    pageLoadingTimeReport = nil
};
v13.didMount = function(v14)
    if not (v12() or not v14.props.pageLoadingTimeReport) then
        v14.props.pageLoadingTimeReport();
    end;
end;
v13.render = function(v15)
    return l_withStyle_0(function(v16)
        return l_withLocalization_0({
            noResultsText = "CommonUI.Messages.Response.NoResults", 
            addFriendsBtn = v9.ADD_FRIENDS_BTN
        })(function(v17)
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -(v10.TOP_BAR_HEIGHT + 45)), 
                LayoutOrder = v15.props.layoutOrder, 
                BackgroundTransparency = 1
            }, {
                IndicatorInner = l_Roact_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.4, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.4)
                }, {
                    UIList = l_Roact_0.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 0)
                    }), 
                    Imagelabel = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/status/oof_xlarge"], 
                        ImageColor3 = v16.Theme.TextMuted.Color, 
                        ImageTransparency = v16.Theme.TextMuted.Transparency, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, 96, 0, 96)
                    }), 
                    Textlabel = l_Roact_0.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Font = l_AppFonts_0.default:getDefault(), 
                        LayoutOrder = 2, 
                        Size = UDim2.new(0, 0, 0, 0), 
                        Text = v17.noResultsText, 
                        TextColor3 = v16.Theme.TextMuted.Color, 
                        TextSize = v16.Font.Header2.RelativeSize * v16.Font.BaseSize, 
                        TextTransparency = v16.Theme.TextMuted.Transparency
                    })
                })
            });
        end);
    end);
end;
return v13;
