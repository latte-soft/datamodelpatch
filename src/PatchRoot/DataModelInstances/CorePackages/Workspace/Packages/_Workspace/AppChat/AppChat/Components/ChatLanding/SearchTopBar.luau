local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.UIBlox);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_TextButton_0 = v4.App.Button.TextButton;
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconSize_0 = v4.App.Constant.IconSize;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_CallbackInputBox_0 = v2.Components.CallbackInputBox;
local v12 = l_Images_0["icons/common/search"];
local v13 = l_Images_0["icons/actions/edit/clear_small"];
local v14 = {
    Image = l_Images_0["squircles/fill"], 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v15 = v3.PureComponent:extend("SearchTopBar");
v15.defaultProps = {
    cancelText = "CancelPlaceholder", 
    searchPlaceholderText = "PlaceholderText", 
    initialInputText = nil, 
    captureFocusOnMount = false, 
    resetOnMount = function()
    end, 
    cancelCallback = nil, 
    textChangedCallback = nil, 
    LayoutOrder = 1, 
    onSelectCallback = function()
    end
};
v15.init = function(v16)
    v16.inputBoxRef = v3.createRef();
    v16.props.onSelectCallback();
    v16.getTextWidth = l_memoize_0(function(v17, v18, v19)
        return l_Text_0.GetTextWidth(v17, v18, v19);
    end);
end;
v15.didMount = function(v20)
    v20.props.resetOnMount();
end;
v15.render = function(v21)
    return v4.Style.withStyle(function(v22)
        local l_cancelText_0 = v21.props.cancelText;
        local l_Header2_0 = v22.Font.Header2;
        local v25 = v21.getTextWidth(l_cancelText_0, l_Header2_0.Font, v22.Font.BaseSize * l_Header2_0.RelativeSize);
        local l_Left_0 = Enum.HorizontalAlignment.Left;
        local v27 = UDim.new(0, 4);
        local v28 = UDim2.new(1, -v25 - 12, 1, 0);
        local l_Body_0 = v22.Font.Body;
        return v3.createElement("Frame", {
            BackgroundTransparency = v22.Theme.BackgroundDefault.Transparency, 
            BackgroundColor3 = v22.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = v21.props.LayoutOrder
        }, {
            layout = v3.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = l_Left_0, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = v27
            }), 
            padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 6), 
                PaddingBottom = UDim.new(0, 6), 
                PaddingLeft = UDim.new(0, 0), 
                PaddingRight = UDim.new(0, 0)
            }), 
            cancel = v3.createElement(l_TextButton_0, {
                text = l_cancelText_0, 
                layoutOrder = 2, 
                onActivated = v21.props.cancelCallback
            }), 
            filterBoxBackground = v3.createElement(l_ImageSetLabel_0, {
                Size = v28, 
                Image = v14.Image, 
                ImageColor3 = v22.Theme.BackgroundMuted.Color, 
                ImageTransparency = v22.Theme.BackgroundMuted.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v14.SliceCenter, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                layout = v3.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                padding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                filterBoxIcon = v3.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                    Image = v12, 
                    ImageColor3 = v22.Theme.IconEmphasis.Color, 
                    ImageTransparency = v22.Theme.IconEmphasis.Transparency, 
                    LayoutOrder = 1
                }), 
                filterBoxContainer = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -(l_IconSize_0.Small + 4), 1, 0), 
                    LayoutOrder = 2
                }, {
                    filterBox = v3.createElement(l_CallbackInputBox_0, {
                        initialInputText = v21.props.initialInputText, 
                        inputTextColor3 = v22.Theme.TextEmphasis.Color, 
                        inputTextFont = l_Body_0.Font, 
                        inputTextSize = v22.Font.BaseSize * l_Body_0.RelativeSize, 
                        inputTextTransparency = v22.Theme.TextEmphasis.Transparency, 
                        inputTextXAlignment = Enum.TextXAlignment.Left, 
                        placeholderText = v21.props.searchPlaceholderText, 
                        placeholderTextColor3 = v22.Theme.TextMuted.Color, 
                        placeholderTextTransparency = v22.Theme.PlaceHolder.Transparency, 
                        captureFocusOnMount = v21.props.captureFocusOnMount, 
                        clearIcon = v13, 
                        clearIconColor3 = v22.Theme.IconEmphasis.Color, 
                        clearIconTransparency = v22.Theme.IconEmphasis.Transparency, 
                        clearButtonSize = l_IconSize_0.Small, 
                        clearButtonDisabled = false, 
                        textChangedCallback = v21.props.textChangedCallback, 
                        onSelectCallback = v21.props.onSelectCallback, 
                        inputBoxRef = v21.inputBoxRef
                    })
                })
            })
        });
    end);
end;
return v15;
