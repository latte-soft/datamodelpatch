local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGame.Constants);
local v4 = v2.Component:extend("SearchBox");
local v5 = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons);
local l_v5_ImagePath_0 = v5:GetImagePath();
local l_v5_Frame_0 = v5:GetFrame("search_border");
local v8 = Rect.new(3, 3, 4, 4);
local l_v5_Frame_1 = v5:GetFrame("search_small");
local l_v5_Frame_2 = v5:GetFrame("clear");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v12 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v13 = require(l_ShareGame_0.getTranslator)();
v4.init = function(v14)
    v14.state = {
        isTextWritten = false
    };
    v14.searchField = nil;
end;
v4.render = function(v15)
    local l_anchorPoint_0 = v15.props.anchorPoint;
    local l_onTextBoxFocusLost_0 = v15.props.onTextBoxFocusLost;
    local l_onTextBoxFocused_0 = v15.props.onTextBoxFocused;
    local l_position_0 = v15.props.position;
    local l_searchFieldRef_0 = v15.props.searchFieldRef;
    local l_size_0 = v15.props.size;
    local l_visible_0 = v15.props.visible;
    local l_zIndex_0 = v15.props.zIndex;
    return v2.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        Size = l_size_0, 
        Visible = l_visible_0, 
        Image = l_v5_ImagePath_0, 
        ImageRectOffset = l_v5_Frame_0.offset, 
        ImageRectSize = l_v5_Frame_0.size, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v8, 
        ZIndex = l_zIndex_0
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 6), 
            PaddingBottom = UDim.new(0, 6)
        }), 
        SearchIcon = v2.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = l_v5_ImagePath_0, 
            ImageRectOffset = l_v5_Frame_1.offset, 
            ImageRectSize = l_v5_Frame_1.size, 
            Size = UDim2.new(0, 16, 0, 16), 
            ZIndex = l_zIndex_0
        }), 
        SearchField = v2.createElement("TextBox", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 28, 0.5, 0), 
            Size = UDim2.new(1, -56, 1, 0), 
            ClearTextOnFocus = false, 
            PlaceholderColor3 = v3.Color.GRAY3, 
            PlaceholderText = v13:FormatByKey("Feature.SettingsHub.Label.SearchForFriendsPlaceholder"), 
            Text = "", 
            TextColor3 = v3.Color.WHITE, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v12.textSize(16), 
            Font = v12.font(Enum.Font.SourceSans), 
            ZIndex = l_zIndex_0, 
            [v2.Ref] = function(v24)
                v15.searchField = v24;
                if l_searchFieldRef_0 then
                    l_searchFieldRef_0(v24);
                end;
            end, 
            [v2.Event.Focused] = function()
                if l_onTextBoxFocused_0 then
                    l_onTextBoxFocused_0();
                end;
            end, 
            [v2.Event.FocusLost] = function(v25)
                if l_onTextBoxFocusLost_0 then
                    l_onTextBoxFocusLost_0(v25.Text);
                end;
            end
        }), 
        ClearButton = v2.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            Size = UDim2.new(0, 16, 0, 16), 
            Image = l_v5_ImagePath_0, 
            ImageRectOffset = l_v5_Frame_2.offset, 
            ImageRectSize = l_v5_Frame_2.size, 
            ZIndex = l_zIndex_0, 
            Visible = v15.state.isTextWritten, 
            [v2.Event.Activated] = function()
                if v15.searchField then
                    v15.searchField.Text = "";
                    v15.searchField:CaptureFocus();
                end;
            end
        })
    });
end;
v4.didMount = function(v26)
    local l_searchField_0 = v26.searchField;
    local l_onTextChanged_0 = v26.props.onTextChanged;
    if l_searchField_0 then
        v26.textBoxChangedConnection = l_searchField_0:GetPropertyChangedSignal("Text"):Connect(function()
            local l_Text_0 = l_searchField_0.Text;
            v26:setState({
                isTextWritten = l_Text_0:len() > 0
            });
            l_onTextChanged_0(l_Text_0);
        end);
    end;
end;
v4.willUnmount = function(v30)
    if v30.textBoxChangedConnection then
        v30.textBoxChangedConnection:Disconnect();
    end;
end;
return v4;
