local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.Parent.Parent.Constants);
local l_MainWindow_0 = v3.DefaultFontSize.MainWindow;
local l_Log_0 = v3.Font.Log;
local l_IconHeight_0 = v3.LogFormatting.IconHeight;
local l_TextFrameHeight_0 = v3.LogFormatting.TextFrameHeight;
local l_TextFramePadding_0 = v3.LogFormatting.TextFramePadding;
local l_MaxStringSize_0 = v3.LogFormatting.MaxStringSize;
local v10 = game:DefineFastFlag("DevConsoleLogTextLabelSizingFix", false);
local v11 = v2.Component:extend("LogOutput");
v11.init = function(v12, v13)
    local v14 = v13.initLogOutput and v13.initLogOutput();
    v12.onCanvasChange = function()
        local l_current_0 = v12.ref.current;
        if l_current_0 then
            local l_CanvasPosition_0 = l_current_0.CanvasPosition;
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            if not (v12.state.canvasPos == l_CanvasPosition_0) or v12.state.absSize ~= l_AbsoluteSize_0 then
                v12:setState({
                    canvasPos = l_CanvasPosition_0, 
                    absSize = l_AbsoluteSize_0, 
                    autoScroll = l_current_0.CanvasPosition.Y + l_current_0.AbsoluteSize.Y == l_current_0.CanvasSize.Y.Offset
                });
            end;
        end;
    end;
    v12.ref = v2.createRef();
    v12.state = {
        logData = v14, 
        absSize = Vector2.new(), 
        canvasPos = Vector2.new(), 
        autoScroll = true, 
        wordWrap = true
    };
end;
v11.willUpdate = function(v18, _, _)
    v18._canvasSignal:Disconnect();
    v18._absSizeSignal:Disconnect();
end;
v11.didUpdate = function(v21)
    v21._canvasSignal = v21.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v21.onCanvasChange);
    v21._absSizeSignal = v21.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(v21.onCanvasChange);
    if v21.state.autoScroll then
        local l_current_1 = v21.ref.current;
        if l_current_1 then
            l_current_1.CanvasPosition = Vector2.new(l_current_1.CanvasPosition.X, v21.ref.current.CanvasSize.Y.Offset + v21.ref.current.AbsoluteSize.Y);
        end;
    end;
end;
v11.didMount = function(v23)
    v23.logConnector = v23.props.targetSignal:Connect(function(v24)
        if not v23.state.autoScroll and v24:getSize() == v24:getMaxSize() then
            local l_canvasPos_0 = v23.state.canvasPos;
            local l_Y_0 = l_canvasPos_0.Y;
            local v27 = v24:back();
            if v27 then
                local l_Y_1 = v27.Dims.Y;
                local v29 = v23.state.absSize.X - l_TextFrameHeight_0;
                if v23.state.wordWrap and v29 > 0 then
                    l_Y_1 = if not v10 then v27.Dims.Y * math.ceil(v27.Dims.X / v29) else math.ceil(v27.Dims.Y * math.ceil(v27.Dims.X / v29));
                end;
                l_Y_0 = math.max(0, (l_Y_0 - l_Y_1) - l_TextFramePadding_0);
            end;
            v23:setState({
                logData = v24, 
                canvasPos = Vector2.new(l_canvasPos_0.X, l_Y_0)
            });
            return ;
        else
            v23:setState({
                logData = v24
            });
            return ;
        end;
    end);
    v23._canvasSignal = v23.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v23.onCanvasChange);
    v23._absSizeSignal = v23.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(v23.onCanvasChange);
    if v23.ref.current.AbsoluteSize.Magnitude > 0 then
        v23:setState({
            absSize = v23.ref.current.AbsoluteSize
        });
    end;
end;
v11.willUnmount = function(v30)
    v30.logConnector:Disconnect();
    v30.logConnector = nil;
end;
v11.render = function(v31)
    local l_layoutOrder_0 = v31.props.layoutOrder;
    local l_size_0 = v31.props.size;
    local l_logData_0 = v31.state.logData;
    local l_absSize_0 = v31.state.absSize;
    local l_canvasPos_1 = v31.state.canvasPos;
    local l_wordWrap_0 = v31.state.wordWrap;
    local v38 = {};
    local v39 = 1;
    local v40 = 0;
    if not (not v31.ref.current or not l_logData_0) then
        local v41 = l_absSize_0.X - l_TextFrameHeight_0;
        local v42 = -1;
        local v43 = 0;
        local v44 = l_logData_0:iterator();
        local v45 = v44:next();
        while v45 do
            local l_Message_0 = v45.Message;
            local l_CharCount_0 = v45.CharCount;
            local l_Y_2 = v45.Dims.Y;
            if l_wordWrap_0 and v41 > 0 then
                l_Y_2 = if not v10 then v45.Dims.Y * math.ceil(v45.Dims.X / v41) else math.ceil(v45.Dims.Y * math.ceil(v45.Dims.X / v41));
            end;
            v39 = v39 + 1;
            if l_canvasPos_1.Y <= v40 + l_Y_2 then
                if v43 < l_absSize_0.Y then
                    local l_Text_0 = v3.Color.Text;
                    local v50 = "";
                    if v45.Type == Enum.MessageType.MessageOutput.Value then
                        l_Text_0 = v3.Color.Text;
                    elseif v45.Type == Enum.MessageType.MessageInfo.Value then
                        l_Text_0 = v3.Color.HighlightBlue;
                        v50 = v3.Image.Info;
                    elseif v45.Type == Enum.MessageType.MessageWarning.Value then
                        l_Text_0 = v3.Color.WarningYellow;
                        v50 = v3.Image.Warning;
                    elseif v45.Type == Enum.MessageType.MessageError.Value then
                        l_Text_0 = v3.Color.ErrorRed;
                        v50 = v3.Image.Error;
                    end;
                    v38[v39] = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, l_Y_2), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v39
                    }, {
                        image = v2.createElement("ImageLabel", {
                            Image = v50, 
                            Size = UDim2.new(0, l_IconHeight_0, 0, l_IconHeight_0), 
                            Position = UDim2.new(0, l_IconHeight_0 / 4, 0.5, -l_IconHeight_0 / 2), 
                            BackgroundTransparency = 1
                        }), 
                        msg = v2.createElement("TextLabel", {
                            Text = l_Message_0, 
                            TextColor3 = l_Text_0, 
                            TextSize = l_MainWindow_0, 
                            Font = l_Log_0, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextWrapped = l_wordWrap_0, 
                            Size = UDim2.new(1, 0, 0, l_Y_2), 
                            Position = UDim2.new(0, l_TextFrameHeight_0, 0, 0), 
                            BackgroundTransparency = 1
                        })
                    });
                end;
                if v42 < 0 then
                    v42 = v40;
                else
                    v43 = (v43 + l_Y_2) + l_TextFramePadding_0;
                end;
            end;
            v40 = (v40 + l_Y_2) + l_TextFramePadding_0;
            if l_CharCount_0 < l_MaxStringSize_0 then
                v45 = v44:next();
            else
                local v51 = string.format(" -- Could not display entire %d character message because message exceeds max displayable length of %d", l_CharCount_0, l_MaxStringSize_0);
                v45 = {
                    Message = v51, 
                    CharCount = #v51, 
                    Type = v45.Type, 
                    Dims = l_TextService_0:GetTextSize(v51, l_MainWindow_0, l_Log_0, Vector2.new())
                };
            end;
        end;
        v38.UIListLayout = v2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_TextFramePadding_0)
        });
        v38.WindowingPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v42), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        });
    end;
    return v2.createElement("ScrollingFrame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        VerticalScrollBarInset = 1, 
        ScrollBarThickness = 6, 
        CanvasSize = UDim2.new(0, 0, 0, v40), 
        CanvasPosition = l_canvasPos_1, 
        LayoutOrder = l_layoutOrder_0, 
        [v2.Ref] = v31.ref
    }, v38);
end;
return v11;
