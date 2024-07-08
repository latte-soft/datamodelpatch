local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v7 = require(l_Parent_0.UIBlox);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local l_ImageSetButton_0 = v7.Core.ImageSet.ImageSetButton;
local v13 = require(l_script_FirstAncestor_0.Components.SearchBar);
local v14 = require(l_script_FirstAncestor_0.Components.WindowedListFrame);
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local v16 = require(l_Parent_0.Otter);
local v17 = v3.PureComponent:extend("ListSearchWidget");
local l_Flint_0 = l_Colors_0.Flint;
local l_Obsidian_0 = l_Colors_0.Obsidian;
local l_White_0 = l_Colors_0.White;
v17.init = function(v21)
    v21.state = {
        fullLoad = false, 
        visible = false, 
        filteredList = v21.props.List
    };
    v21.visibility = 0;
    v21.visibilityTarget = 0;
    v21.baseFrameRef = v3.createRef();
    v21.getWidgetPosition = function()
        return UDim2.new(0.5, 0, 2 - v21.visibility, 10);
    end;
    v21.searchTextChanged = function(v22)
        local v23 = string.lower(v22.Text);
        if v23 == "" then
            if v21.state.filteredList ~= v21.props.List then
                v21:setState({
                    filteredList = v21.props.List
                });
                return ;
            end;
        else
            local v24 = {};
            for _, v26 in ipairs(v21.props.List) do
                if string.find(string.lower(v26.localizedName), v23, 1, true) then
                    table.insert(v24, v26);
                end;
            end;
            v21:setState({
                filteredList = v24
            });
        end;
    end;
    v21.renderWidgetBackground = function(v27)
        local v28 = 1.4 * v27.closeButtonSize;
        if not v27.isWideScreen then
            local v29 = v27.closeButtonSize + 20;
            return v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 10), 
                Position = v27.Position, 
                AnchorPoint = Vector2.new(0.5, 1), 
                BackgroundColor3 = l_Flint_0, 
                Visible = v27.Visible, 
                [v3.Ref] = v21.baseFrameRef
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 40), 
                    PaddingLeft = UDim.new(0, 20), 
                    PaddingRight = UDim.new(0, 20), 
                    PaddingBottom = UDim.new(0, 10)
                }), 
                CloseButton = v3.createElement(l_ImageSetButton_0, {
                    Size = UDim2.new(0, v27.closeButtonSize, 0, v27.closeButtonSize), 
                    Image = l_GetImageData_0("LuaApp/icons/GameDetails/navigation/close") or "LuaApp/icons/GameDetails/navigation/close", 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.21, 0), 
                    [v3.Event.Activated] = v27.CloseCallback
                }), 
                ContentWrapper = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, -v29), 
                    Position = UDim2.new(0, 0, 0, v29)
                }, v27.contents)
            });
        else
            return v3.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 1, -v28 + 10), 
                Position = v27.Position, 
                AnchorPoint = Vector2.new(0.5, 1), 
                BackgroundTransparency = 1, 
                Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                ImageColor3 = l_Flint_0, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9), 
                Visible = v27.Visible, 
                [v3.Ref] = v21.baseFrameRef
            }, {
                CloseButton = v3.createElement(l_ImageSetButton_0, {
                    Size = UDim2.new(0, v27.closeButtonSize, 0, v27.closeButtonSize), 
                    AnchorPoint = Vector2.new(0, 1), 
                    Image = l_GetImageData_0("LuaApp/icons/GameDetails/navigation/close") or "LuaApp/icons/GameDetails/navigation/close", 
                    BackgroundTransparency = 1, 
                    [v3.Event.Activated] = v27.CloseCallback
                }), 
                UISizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(600, math.huge)
                }), 
                ContentWrapper = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -80, 1, -50), 
                    Position = UDim2.new(0, 40, 0, 40)
                }, v27.contents)
            });
        end;
    end;
end;
v17.didMount = function(v30)
    v30.motor = v16.createSingleMotor(v30.visibility);
    v30.motor:onStep(function(v31)
        v30.visibility = v31;
        if v30.baseFrameRef.current then
            v30.baseFrameRef.current.Position = v30.getWidgetPosition();
            v30.baseFrameRef.current.Parent.BackgroundTransparency = 1 - 0.5 * v30.visibility;
        end;
        if not (v31 == 0) or not v30.state.visible then
            if not (not (v31 == 1) or v30.state.fullLoad) then
                v30:setState({
                    fullLoad = true
                });
            end;
            return ;
        else
            v30:setState({
                visible = false
            });
            return ;
        end;
    end);
end;
v17.willUnmount = function(v32)
    if v32.motor then
        v32.motor:destroy();
    end;
end;
v17.defaultProps = {
    SearchPlaceholder = "Feature.Chat.Label.SearchWord"
};
v17.render = function(v33)
    local v34 = v33.props.formFactor == l_FormFactor_0.WIDE;
    local v35 = 27;
    local v36 = 14;
    local v37 = 24;
    local v38 = 24;
    local v39 = v36 + 36;
    if v34 then
        v35 = 48;
        v36 = 18;
        v37 = 30;
        v38 = 24;
        v39 = v36 + 48;
    end;
    local v40 = v36 * 2.4;
    local v41 = (40 + v40) + v38;
    local v42 = v33.props.VisibilityTarget == 1;
    return l_withLocalization_0({
        heading = v33.props.Heading, 
        search = v33.props.SearchPlaceholder
    })(function(v43)
        local v44 = nil;
        if v42 then
            v44 = false;
        end;
        return v3.createElement(not v42 and "Frame" or "TextButton", {
            AutoButtonColor = v44, 
            Text = if not v42 then nil else "", 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 1 - 0.5 * v33.visibility, 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0
        }, {
            v3.createElement(v33.renderWidgetBackground, {
                isWideScreen = v34, 
                closeButtonSize = v35, 
                Position = v33.getWidgetPosition(), 
                CloseCallback = v33.props.CloseCallback, 
                Visible = v33.state.visible, 
                contents = {
                    Heading = v3.createElement("TextLabel", {
                        Text = v43.heading, 
                        Size = UDim2.new(1, 0, 0, v38), 
                        TextSize = v38, 
                        Font = l_AppFonts_0.default:getBold(), 
                        TextColor3 = l_White_0, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    SearchBar = v3.createElement(v13, {
                        Size = UDim2.new(1, 0, 0, v40), 
                        Position = UDim2.new(0, 0, 0, v38 + 20), 
                        ImageColor3 = l_Obsidian_0, 
                        PlaceholderText = v43.search, 
                        PlaceholderColor3 = l_Flint_0, 
                        IconSize = v37, 
                        Text = "", 
                        TextSize = v36, 
                        TextColor3 = l_White_0, 
                        TextChanged = v33.searchTextChanged
                    }), 
                    ListFrame = v3.createElement(v14, {
                        List = v33.state.filteredList, 
                        ScrollingFrameOffset = v41, 
                        TextSize = v36, 
                        ButtonSizeY = v39, 
                        ListButton = v33.props.ListButton, 
                        ListButtonProps = {
                            TextSize = v36, 
                            SelectionCallback = v33.props.SelectionCallback
                        }
                    })
                }
            })
        });
    end);
end;
v17.didUpdate = function(v45, v46)
    if not (not (v45.visibilityTarget ~= v45.props.VisibilityTarget) or not v45.motor) then
        v45.visibilityTarget = v45.props.VisibilityTarget;
        v45.motor:setGoal(v16.spring(v45.visibilityTarget), {
            frequency = 3
        });
        if not (not (v45.visibilityTarget > 0) or v45.state.visible) then
            v45:setState({
                visible = true
            });
        end;
    end;
    if not (v46.List == v45.props.List) or v45.props.VisibilityTarget == 1 and v46.VisibilityTarget ~= 1 then
        v45:setState({
            filteredList = v45.props.List
        });
    end;
end;
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})((v4.connect(function(v47, _)
    return {
        formFactor = v47.FormFactor
    };
end)(v17)));
