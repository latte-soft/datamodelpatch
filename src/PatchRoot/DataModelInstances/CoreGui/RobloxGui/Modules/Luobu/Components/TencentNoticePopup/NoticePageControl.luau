local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_withStyle_0 = v7.Style.withStyle;
local l_ExternalEventConnection_0 = v7.Utility.ExternalEventConnection;
local v11 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v12 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v13 = require(l_Modules_0.Luobu.Actions.DecrementUnreadTencentNoticeCount);
local v14 = require(l_Modules_0.Luobu.Actions.ReadTencentNoticeId);
local v15 = require(l_Modules_0.Luobu.Components.TencentNoticePopup.NoticePageControlItem);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v17 = require(l_Modules_0.Luobu.Enum.MemStorageKeys);
local v18 = require(l_CorePackages_0.Packages.t);
local v19 = require(l_CorePackages_0.Otter);
local v20 = {
    dampingRatio = 1, 
    frequency = 10
};
local v21 = v5.PureComponent:extend("NoticePageControl");
v21.validateProps = v18.strictInterface({
    noticeList = v18.table, 
    onActivated = v18.callback, 
    settings = v18.strictInterface({
        widePopupWidth = v18.number, 
        widePopupHeight = v18.number, 
        headerHeight = v18.number, 
        bottomHeight = v18.number, 
        compactHeightToWidthRatio = v18.number
    }), 
    formFactor = v18.string, 
    screenSize = v18.Vector2, 
    openNoticeDetail = v18.callback, 
    decrementUnreadTencentNoticeCount = v18.callback, 
    readTencentNoticeId = v18.callback
});
v21.checkInsidePage = function(v22, v23, v24)
    local l_formFactor_0 = v22.props.formFactor;
    local l_X_0 = v22.props.screenSize.X;
    local l_Y_0 = v22.props.screenSize.Y;
    local l_bottomHeight_0 = v22.props.settings.bottomHeight;
    if l_formFactor_0 == l_FormFactor_0.WIDE then
        local v29 = (l_X_0 - v22.props.settings.widePopupWidth) / 2;
        local v30 = (l_Y_0 - v22.props.settings.widePopupWidth) / 2;
        if not (v23 >= v29) or l_X_0 - v29 < v23 then
            return false;
        elseif not (v24 >= v30) or (l_Y_0 - v30) - l_bottomHeight_0 < v24 then
            return false;
        end;
    elseif not (v23 >= 24) or l_X_0 - 24 < v23 then
        return false;
    else
        local v31 = (l_Y_0 - v22.topHeight) / 2;
        if not (v24 >= v31) or (l_Y_0 - v31) - l_bottomHeight_0 < v24 then
            return false;
        end;
    end;
    return true;
end;
v21.init = function(v32)
    v32.state = {
        selectedValue = 1
    };
    local v33, v34 = v5.createBinding(0);
    v32.positionX = v33;
    v32.updatePositionX = v34;
    v32.touchTapCallback = function(v35)
        local v36 = v32.props.noticeList[v32.state.selectedValue];
        if v36.noticeUrl == nil then
            return ;
        elseif v32:checkInsidePage(v35[1].X, v35[1].Y) == false then
            return ;
        else
            v32.props.openNoticeDetail(v36.noticeUrl, v32.props.noticeList[v32.state.selectedValue].title);
            if v36.hasRead == false then
                l_MemStorageService_0:Fire(v17.TencentNoticeIdReadStatus, l_HttpService_0:JSONEncode({
                    noticeId = v36.noticeId, 
                    endTime = v36.endTime
                }));
            end;
            v32.props.decrementUnreadTencentNoticeCount();
            v32.props.readTencentNoticeId(v36.noticeId);
            local l_selectedValue_0 = v32.state.selectedValue;
            if l_selectedValue_0 == #v32.props.noticeList then
                v32.props.onActivated();
                return ;
            else
                local v38 = (not not (v32.props.formFactor == l_FormFactor_0.WIDE) and v32.props.settings.widePopupWidth or v32.compactWidth) * l_selectedValue_0;
                v32:setState({
                    selectedValue = l_selectedValue_0 + 1
                });
                v32.motor:setGoal(v19.spring(v38, v20));
                return ;
            end;
        end;
    end;
    v32.goalLocation = 0;
    v32.compactWidth = v32.props.screenSize.X - 48;
    v32.touchMoveCallback = function(v39)
        local l_X_1 = v39.Position.X;
        local l_Y_1 = v39.Position.Y;
        if v32.isMoving or v32:checkInsidePage(l_X_1, l_Y_1) == false then
            return ;
        else
            local v42 = not not (v32.props.formFactor == l_FormFactor_0.WIDE) and v32.props.settings.widePopupWidth or v32.compactWidth;
            if math.abs(v39.Delta.X) > 20 then
                local v43 = math.clamp(v32.state.selectedValue - math.sign(v39.Delta.X), 1, #v32.props.noticeList);
                v32:setState({
                    selectedValue = v43
                });
                local v44 = v42 * (v43 - 1);
                v32.motor:setGoal(v19.spring(v44, v20));
                v32.goalLocation = v44;
                v32.isMoving = true;
            end;
            return ;
        end;
    end;
    v32.motor = v19.createSingleMotor(1);
    v32.motor:onStep(function(v45)
        local v46 = math.abs(v45 - v32.goalLocation);
        if v46 == 0 then
            return ;
        elseif v46 < 1 then
            v32.updatePositionX(v32.goalLocation);
            return ;
        else
            v32.updatePositionX(v45);
            return ;
        end;
    end);
    v32.motor:onComplete(function()
        v32.isMoving = false;
    end);
end;
v21.didMount = function(v47)
    if v47.props.onMounted then
        v47.props.onMounted();
    end;
end;
v21.willUnmount = function(v48)
    if v48.motor then
        v48.motor:destroy();
    end;
end;
v21.render = function(v49)
    local v50 = v49.props.formFactor == l_FormFactor_0.WIDE;
    local v51 = nil;
    local v52 = nil;
    if not v50 then
        v51 = v49.compactWidth;
        v52 = v51 * v49.props.settings.compactHeightToWidthRatio;
    else
        v51 = v49.props.settings.widePopupWidth;
        v52 = v49.props.settings.widePopupHeight;
    end;
    local v53 = #v49.props.noticeList * v51;
    local l_bottomHeight_1 = v49.props.settings.bottomHeight;
    local l_headerHeight_0 = v49.props.settings.headerHeight;
    local v56 = (l_headerHeight_0 + v52) + l_bottomHeight_1;
    local v57 = #v49.props.noticeList == 1;
    v49.topHeight = l_headerHeight_0 + v52;
    local v58 = {
        Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    for v59, v60 in ipairs(v49.props.noticeList) do
        v58["NoticePageControlItem" .. v59] = v5.createElement(v15, {
            headerHeight = l_headerHeight_0, 
            contentHeight = v52, 
            width = v51, 
            notice = v60, 
            layoutOrder = v59, 
            hasOneNotice = v57
        });
    end;
    return l_withStyle_0(function(v61)
        local l_Theme_0 = v61.Theme;
        return v5.createElement("ImageLabel", {
            Size = UDim2.fromOffset(v51, v56), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            TopFrame = v5.createElement("Frame", {
                Size = UDim2.fromOffset(v51, v49.topHeight), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 0, 
                ClipsDescendants = true
            }, {
                PageIndicator = v49:renderIndicator(l_Theme_0, v51, l_headerHeight_0, v52), 
                TouchMoved = v5.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.TouchMoved, 
                    callback = v49.touchMoveCallback
                }), 
                TouchTap = v5.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.TouchTap, 
                    callback = v49.touchTapCallback, 
                    ZIndex = 2
                }), 
                ScrollingList = v5.createElement("Frame", {
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    Size = UDim2.fromOffset(v53, l_headerHeight_0 + v52), 
                    Position = v49.positionX:map(function(v63)
                        return UDim2.fromOffset(-v63, 0);
                    end), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2
                }, v58)
            }), 
            BottomFrame = v5.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                Size = UDim2.fromOffset(v51, l_bottomHeight_1), 
                Position = UDim2.new(0, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                CloseButton = v5.createElement(v11, {
                    Size = UDim2.fromOffset(48, 48), 
                    Position = UDim2.new(0.5, -24, 0.5, -24), 
                    Image = "LuaApp/icons/Luobu/close-circle", 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v5.Event.Activated] = v49.props.onActivated
                })
            })
        });
    end);
end;
local function v66(v64, v65)
    return v5.createElement("Frame", {
        Size = UDim2.fromOffset(16, 16), 
        Position = UDim2.fromOffset(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        BorderSizePixel = 0
    }, (v5.createElement("ImageLabel", {
        BackgroundColor3 = v64.Divider.Color, 
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = v65, 
        ZIndex = 3, 
        BorderSizePixel = 0
    }, {
        UICorner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        })
    })));
end;
v21.renderIndicator = function(v67, v68, v69, v70, v71)
    local v72 = #v67.props.noticeList;
    if v72 <= 1 then
        return ;
    else
        local v73 = {};
        table.insert(v73, (v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        })));
        for v74 = 1, v72 do
            local v75 = 0.7;
            if v74 == v67.state.selectedValue then
                v75 = 0;
            end;
            table.insert(v73, (v66(v68, v75)));
        end;
        return v5.createElement("Frame", {
            Size = UDim2.fromOffset(v69, 48), 
            Position = UDim2.fromOffset(0, (v70 + v71) - 48), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ZIndex = 3
        }, v73);
    end;
end;
return (v6.connect(function(v76)
    return {
        formFactor = v76.FormFactor, 
        screenSize = v76.ScreenSize
    };
end, function(v77)
    return {
        openNoticeDetail = function(v78, v79)
            v77(v12(v78, v79));
        end, 
        decrementUnreadTencentNoticeCount = function()
            return v77(v13());
        end, 
        readTencentNoticeId = function(v80)
            return v77(v14(v80));
        end
    };
end)(v21));
