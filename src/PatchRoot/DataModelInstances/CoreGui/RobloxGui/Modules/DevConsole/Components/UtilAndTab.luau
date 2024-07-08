local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.Parent.Constants);
local l_FrameHeight_0 = v3.TabRowFormatting.FrameHeight;
local l_TabDropDownWidth_0 = v3.TabRowFormatting.TabDropDownWidth;
local l_TabOverlapThreshold_0 = v3.TabRowFormatting.TabOverlapThreshold;
local l_FrameHeight_1 = v3.UtilityBarFormatting.FrameHeight;
local l_SmallFrameHeight_0 = v3.UtilityBarFormatting.SmallFrameHeight;
local l_SmallUtilPadding_0 = v3.UtilityBarFormatting.SmallUtilPadding;
local l_ClientServerButtonWidth_0 = v3.UtilityBarFormatting.ClientServerButtonWidth;
local l_ClientServerDropDownWidth_0 = v3.UtilityBarFormatting.ClientServerDropDownWidth;
local l_MainRowPadding_0 = v3.GeneralFormatting.MainRowPadding;
local l_Parent_0 = script.Parent;
local v14 = require(l_Parent_0.ClientServerButton);
local v15 = require(l_Parent_0.CheckBoxContainer);
local v16 = require(l_Parent_0.TabRowContainer);
local v17 = require(l_Parent_0.SearchBar);
local v18 = v2.Component:extend("UtilAndTab");
v18.init = function(v19)
    local l_tabList_0 = v19.props.tabList;
    local v21 = 0;
    local v22 = 0;
    for v23, _ in pairs(l_tabList_0) do
        v21 = v21 + l_TextService_0:GetTextSize(v23, v3.DefaultFontSize.TabBar, v3.Font.TabBar, Vector2.new(0, 0)).X;
        v22 = v22 + 1;
    end;
    v19.showSearchBar = function()
        v19:setState({
            activeSearchTerm = true
        });
    end;
    v19.cancelInput = function(_, v26)
        if not (v26.UserInputType ~= Enum.UserInputType.MouseButton1) or v26.UserInputType == Enum.UserInputType.Touch and v26.UserInputState == Enum.UserInputState.End then
            if v19.searchRef.current then
                v19.searchRef.current.Text = "";
            end;
            local l_onSearchTermChanged_0 = v19.props.onSearchTermChanged;
            if l_onSearchTermChanged_0 then
                l_onSearchTermChanged_0("");
            end;
            v19:setState({
                activeSearchTerm = false
            });
        end;
    end;
    v19.focusLost = function(v28, v29, _)
        if v29 then
            local l_text_0 = v28.text;
            local l_onSearchTermChanged_1 = v19.props.onSearchTermChanged;
            if l_onSearchTermChanged_1 then
                l_onSearchTermChanged_1(l_text_0);
            end;
            local v33 = l_text_0 ~= "";
            if v19.state.activeSearchTerm ~= v33 then
                v19:setState({
                    activeSearchTerm = v33
                });
            end;
        end;
    end;
    v19.state = {
        totalTabWidth = v21, 
        totalTabCount = v22, 
        activeSearchTerm = false
    };
    v19.utilRef = v2.createRef();
    v19.searchRef = v2.createRef();
end;
v18.render = function(v34)
    local l_windowWidth_0 = v34.props.windowWidth;
    local l_formFactor_0 = v34.props.formFactor;
    local l_tabList_1 = v34.props.tabList;
    local l_orderedCheckBoxState_0 = v34.props.orderedCheckBoxState;
    local l_layoutOrder_0 = v34.props.layoutOrder;
    local l_isClientView_0 = v34.props.isClientView;
    local l_searchTerm_0 = v34.props.searchTerm;
    local l_onClientButton_0 = v34.props.onClientButton;
    local l_onServerButton_0 = v34.props.onServerButton;
    local l_onCheckBoxChanged_0 = v34.props.onCheckBoxChanged;
    local l_onSearchTermChanged_2 = v34.props.onSearchTermChanged;
    local l_totalTabWidth_0 = v34.state.totalTabWidth;
    local l_totalTabCount_0 = v34.state.totalTabCount;
    local l_activeSearchTerm_0 = v34.state.activeSearchTerm;
    local v49 = (l_windowWidth_0 - l_totalTabWidth_0) / l_totalTabCount_0;
    local v50 = false;
    if v49 < l_TabOverlapThreshold_0 then
        v50 = l_windowWidth_0 > 0;
    end;
    local v51 = nil;
    local v52 = l_formFactor_0 == v3.FormFactor.Small and l_SmallFrameHeight_0 or l_FrameHeight_1;
    local v53 = l_formFactor_0 == v3.FormFactor.Small and 6 or 7;
    local v54 = not not v34.props[v2.Children] and math.ceil(#v34.props[v2.Children] / 5) or 1;
    v51 = v2.createElement("Frame", {
        Position = UDim2.new(1, -v53 * l_ClientServerButtonWidth_0 - l_MainRowPadding_0, 0, 0), 
        Size = UDim2.new(0, 5 * l_ClientServerButtonWidth_0, 0, v52 * v54), 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIGridLayout", {
            CellPadding = UDim2.new(0, l_MainRowPadding_0, 0, 0), 
            CellSize = UDim2.new(0, l_ClientServerButtonWidth_0, 0, v52), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirectionMaxCells = 5
        }); 
        unpack(v34.props[v2.Children] or {})
    });
    if l_formFactor_0 ~= v3.FormFactor.Small and not v50 then
        local v55 = l_onClientButton_0 and l_onServerButton_0;
        local v56 = (l_windowWidth_0 - l_SmallUtilPadding_0 * 3) - 3 * l_ClientServerButtonWidth_0;
        if v55 then
            v56 = v56 - l_ClientServerButtonWidth_0;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, (l_FrameHeight_0 + l_FrameHeight_1 * v54) + l_MainRowPadding_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            [v2.Ref] = v34.props.refForParent
        }, {
            Tabs = v2.createElement(v16, {
                tabList = l_tabList_1, 
                windowWidth = l_windowWidth_0, 
                frameHeight = l_FrameHeight_0, 
                formFactor = l_formFactor_0
            }), 
            UtilBar = v2.createElement("Frame", {
                Position = UDim2.new(0, 4, 0, l_FrameHeight_0 + l_MainRowPadding_0), 
                Size = UDim2.new(1, -8, 0, l_FrameHeight_1), 
                BackgroundTransparency = 1, 
                [v2.Ref] = v34.utilRef
            }, {
                MainRow = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        Padding = UDim.new(0, l_SmallUtilPadding_0)
                    }), 
                    ClientServerButton = v55 and v2.createElement(v14, {
                        formFactor = l_formFactor_0, 
                        isClientView = l_isClientView_0, 
                        onClientButton = l_onClientButton_0, 
                        onServerButton = l_onServerButton_0
                    }), 
                    FilterCheckBoxes = l_onCheckBoxChanged_0 and v2.createElement(v15, {
                        orderedCheckBoxState = l_orderedCheckBoxState_0, 
                        frameWidth = v56, 
                        frameHeight = l_FrameHeight_1, 
                        pos = UDim2.new(0, 2 * l_ClientServerButtonWidth_0 + l_MainRowPadding_0, 0, 0), 
                        onCheckBoxChanged = l_onCheckBoxChanged_0
                    })
                }), 
                SearchBar = l_onSearchTermChanged_2 and v2.createElement(v17, {
                    size = UDim2.new(0, 2 * l_ClientServerButtonWidth_0, 0, l_FrameHeight_1), 
                    pos = UDim2.new(1, -2 * l_ClientServerButtonWidth_0, 0, 0), 
                    searchTerm = l_searchTerm_0, 
                    showClear = l_activeSearchTerm_0, 
                    textSize = v3.DefaultFontSize.Search, 
                    font = v3.Font.Search, 
                    frameHeight = v3.UtilityBarFormatting.FrameHeight, 
                    refForParent = v34.searchRef, 
                    cancelInput = v34.cancelInput, 
                    focusLost = v34.focusLost
                }), 
                Buttons = v51
            })
        });
    else
        local v57 = l_SmallFrameHeight_0 * v54 + l_SmallUtilPadding_0;
        if l_activeSearchTerm_0 then
            v57 = (v57 + l_SmallFrameHeight_0) + l_SmallUtilPadding_0;
        end;
        local v58 = l_onClientButton_0 and l_onServerButton_0;
        local v59 = (l_windowWidth_0 - l_SmallFrameHeight_0) - l_TabDropDownWidth_0;
        if v58 then
            v59 = v59 - l_ClientServerDropDownWidth_0;
        end;
        local v60 = l_TextService_0:GetTextSize("Cancel", v3.DefaultFontSize.UtilBar, v3.Font.UtilBar, Vector2.new(0, 0)).X + 12;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v57), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            [v2.Ref] = v34.props.refForParent
        }, {
            MainFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_SmallFrameHeight_0), 
                BackgroundTransparency = 1, 
                [v2.Ref] = v34.utilRef
            }, {
                MainRow = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        Padding = UDim.new(0, l_SmallUtilPadding_0)
                    }), 
                    Tabs = v2.createElement(v16, {
                        tabList = l_tabList_1, 
                        windowWidth = l_windowWidth_0, 
                        frameHeight = l_SmallFrameHeight_0, 
                        formFactor = l_formFactor_0, 
                        layoutOrder = 1
                    }), 
                    ClientServerButton = v58 and v2.createElement(v14, {
                        frameHeight = l_SmallFrameHeight_0, 
                        formFactor = l_formFactor_0, 
                        useDropDown = v50, 
                        isClientView = l_isClientView_0, 
                        layoutOrder = 2, 
                        onClientButton = l_onClientButton_0, 
                        onServerButton = l_onServerButton_0
                    }), 
                    FilterCheckBoxes = l_onCheckBoxChanged_0 and v2.createElement(v15, {
                        orderedCheckBoxState = l_orderedCheckBoxState_0, 
                        frameWidth = v59, 
                        frameHeight = l_SmallFrameHeight_0, 
                        pos = UDim2.new(0, 2 * l_ClientServerButtonWidth_0 + l_MainRowPadding_0, 0, 0), 
                        layoutOrder = 3, 
                        onCheckBoxChanged = l_onCheckBoxChanged_0
                    })
                }), 
                SearchButton = v2.createElement("ImageButton", {
                    Size = UDim2.new(0, l_SmallFrameHeight_0, 0, l_SmallFrameHeight_0), 
                    Position = UDim2.new(1, -l_SmallFrameHeight_0, 0, 0), 
                    BackgroundTransparency = 1, 
                    Image = v3.Image.Search, 
                    Visible = not l_activeSearchTerm_0, 
                    [v2.Event.Activated] = v34.showSearchBar
                }), 
                Buttons = v51
            }), 
            SearchBarFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_SmallFrameHeight_0), 
                Position = UDim2.new(0, 0, 0, (l_SmallFrameHeight_0 + l_SmallUtilPadding_0) * v54), 
                Visible = l_activeSearchTerm_0, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                SearchBar = v2.createElement(v17, {
                    size = UDim2.new(1, -v60, 0, l_SmallFrameHeight_0), 
                    searchTerm = l_searchTerm_0, 
                    showClear = l_activeSearchTerm_0, 
                    textSize = v3.DefaultFontSize.Search, 
                    font = v3.Font.Search, 
                    frameHeight = l_SmallFrameHeight_0, 
                    refForParent = v34.searchRef, 
                    cancelInput = v34.cancelInput, 
                    focusLost = v34.focusLost
                }), 
                CancelButton = v2.createElement("TextButton", {
                    Size = UDim2.new(0, v60, 1, 0), 
                    Position = UDim2.new(1, -v60, 0, 0), 
                    Text = "Cancel", 
                    TextSize = v3.DefaultFontSize.UtilBar, 
                    TextColor3 = v3.Color.Text, 
                    Font = v3.Font.UtilBar, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v2.Event.Activated] = v34.cancelInput
                })
            })
        });
    end;
end;
return v18;
