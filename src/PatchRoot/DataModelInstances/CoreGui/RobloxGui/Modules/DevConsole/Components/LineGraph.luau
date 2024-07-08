local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.LineGraphHoverDisplay);
local v2 = require(script.Parent.Parent.Constants);
local l_Text_0 = v2.Color.Text;
local l_HighlightBlue_0 = v2.Color.HighlightBlue;
local l_LineWidth_0 = v2.GeneralFormatting.LineWidth;
local l_LineColor_0 = v2.GeneralFormatting.LineColor;
local l_PointWidth_0 = v2.Graph.PointWidth;
local l_PointOffset_0 = v2.Graph.PointOffset;
local l_Padding_0 = v2.Graph.Padding;
local l_Scale_0 = v2.Graph.Scale;
local l_InnerPaddingY_0 = v2.Graph.InnerPaddingY;
local l_InnerScaleY_0 = v2.Graph.InnerScaleY;
local l_TextPadding_0 = v2.Graph.TextPadding;
local v14 = v0.Component:extend("LineGraph");
v14.init = function(v15)
    v15.onGraphInputChanged = function(_, v17)
        if not (not (v17.UserInputType == Enum.UserInputType.MouseMovement) or v15.state.holdPos) then
            v15:setState({
                inputPosition = v17.Position
            });
        end;
    end;
    v15.onGraphInputEnded = function(_, v19)
        if v19.UserInputType == Enum.UserInputType.MouseMovement then
            if not v15.state.holdPos then
                v15:setState({
                    inputPosition = false
                });
                return ;
            end;
        elseif v19.UserInputType == Enum.UserInputType.MouseButton1 then
            v15:setState({
                holdPos = not v15.state.holdPos
            });
        end;
    end;
    v15.graphRef = v0.createRef();
    v15.state = {
        selectedTimeStamps = {}
    };
end;
v14.didUpdate = function(v20)
    if v20.state.absGraphSize ~= v20.graphRef.current.AbsoluteSize then
        v20:setState({
            absGraphSize = v20.graphRef.current.AbsoluteSize, 
            absGraphPos = v20.graphRef.current.AbsolutePosition
        });
    end;
end;
v14.didMount = function(v21)
    v21:setState({
        absGraphSize = v21.graphRef.current.AbsoluteSize, 
        absGraphPos = v21.graphRef.current.AbsolutePosition
    });
end;
v14.render = function(v22)
    local l_size_0 = v22.props.size;
    local l_pos_0 = v22.props.pos;
    local l_graphData_0 = v22.props.graphData;
    local l_getX_0 = v22.props.getX;
    local l_getY_0 = v22.props.getY;
    local l_stringFormatX_0 = v22.props.stringFormatX;
    local l_stringFormatY_0 = v22.props.stringFormatY;
    local l_axisLabelX_0 = v22.props.axisLabelX;
    local l_axisLabelY_0 = v22.props.axisLabelY;
    local l_layoutOrder_0 = v22.props.layoutOrder;
    local l_inputPosition_0 = v22.state.inputPosition;
    local l_absGraphSize_0 = v22.state.absGraphSize;
    local l_absGraphPos_0 = v22.state.absGraphPos;
    local v36 = l_getX_0(l_graphData_0:back());
    local v37 = l_getX_0(l_graphData_0:front());
    local l_maxY_0 = v22.props.maxY;
    local l_minY_0 = v22.props.minY;
    local v40 = nil;
    local v41 = {};
    if l_absGraphSize_0 then
        local v42 = {};
        local v43 = l_graphData_0:iterator();
        local v44 = v43:next();
        while v44 do
            local v45 = l_getY_0(v44);
            local v46 = l_getX_0(v44);
            local v47 = v36 - v37;
            local v48 = v47 > 0 and (v46 - v37) / v47 or 0;
            local v49 = l_maxY_0 - l_minY_0;
            table.insert(v42, {
                X = v48, 
                Y = v49 > 0 and (v45 - l_minY_0) / v49 or 1, 
                data = v44
            });
            v44 = v43:next();
        end;
        for v50 = 2, #v42 do
            local v51 = v42[v50].X * l_absGraphSize_0.X;
            local v52 = (v42[v50].Y * l_absGraphSize_0.Y) * l_InnerScaleY_0;
            local v53 = v42[v50 - 1].X * l_absGraphSize_0.X;
            local v54 = (v42[v50 - 1].Y * l_absGraphSize_0.Y) * l_InnerScaleY_0;
            if v51 ~= v53 then
                local v55 = (v51 + v53) / 2;
                local v56 = (v52 + v54) / 2;
                local v57 = v51 - v53;
                local v58 = v52 - v54;
                local v59 = math.sqrt(v57 * v57 + v58 * v58);
                table.insert(v41, v0.createElement("Frame", {
                    Size = UDim2.new(0, v59, 0, l_LineWidth_0), 
                    Position = UDim2.new(0, v55 - v59 / 2, 1 - l_InnerPaddingY_0, -v56), 
                    BackgroundColor3 = l_HighlightBlue_0, 
                    BorderSizePixel = 0, 
                    Rotation = -math.deg((math.atan2(v58, v57)))
                }));
                table.insert(v41, v0.createElement("Frame", {
                    Size = UDim2.new(0, l_PointWidth_0, 0, l_PointWidth_0), 
                    Position = UDim2.new(0, v51, 1 - l_InnerPaddingY_0, -v52 - l_PointOffset_0), 
                    BackgroundColor3 = l_HighlightBlue_0, 
                    BorderSizePixel = 0
                }));
                if l_inputPosition_0 then
                    local v60 = l_inputPosition_0.X - l_absGraphPos_0.X;
                    if v60 < v51 and v53 < v60 then
                        local v61 = l_getX_0(v42[v50].data);
                        local v62 = l_getX_0(v42[v50 - 1].data);
                        local v63 = l_getY_0(v42[v50].data);
                        local v64 = l_getY_0(v42[v50 - 1].data);
                        local v65 = (v60 - v53) / v57;
                        v40 = v54 + v58 * v65;
                        v41.HoverDetails = v0.createElement(v1, {
                            hoverLineX = v60, 
                            hoverLineY = v40, 
                            hoverValX = (v61 - v62) * v65 + v62, 
                            hoverValY = (v63 - v64) * v65 + v64, 
                            stringFormatX = l_stringFormatX_0, 
                            stringFormatY = l_stringFormatY_0
                        });
                    end;
                end;
            end;
        end;
        if #v42 > 0 then
            local v66 = (v42[#v42].Y * l_absGraphSize_0.Y) * l_InnerScaleY_0;
            local v67 = l_getY_0(v42[#v42].data);
            local v68 = not (v40 and math.abs(v66 - v40) < 10);
            local v69 = not (v40 and math.abs(v40) < 10 or math.abs(v66) < 10);
            if v68 then
                v41.LatestEntryLine = v0.createElement("Frame", {
                    Size = UDim2.new(1, l_TextPadding_0, 0, l_LineWidth_0), 
                    Position = UDim2.new(0, -l_TextPadding_0, 1 - l_InnerPaddingY_0, -v66), 
                    BackgroundColor3 = l_LineColor_0, 
                    BackgroundTransparency = 0.5, 
                    BorderSizePixel = 0
                });
                v41.LatestEntryText = v0.createElement("TextLabel", {
                    Text = not not l_stringFormatY_0 and l_stringFormatY_0(v67) or v67, 
                    TextColor3 = l_Text_0, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    Position = UDim2.new(0, -l_TextPadding_0 - 2, 1 - l_InnerPaddingY_0, -v66), 
                    BackgroundTransparency = 1
                });
            end;
            if v69 then
                v41.AxisTextY0 = v0.createElement("TextLabel", {
                    Text = not not l_stringFormatY_0 and l_stringFormatY_0(l_minY_0) or l_minY_0, 
                    TextColor3 = l_Text_0, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    Position = UDim2.new(0, -l_TextPadding_0 - 2, 1 - l_InnerPaddingY_0, 0), 
                    BackgroundTransparency = 1
                });
            end;
            v41.AxisX = v0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            });
            v41.AxisY = v0.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            });
        end;
    end;
    local v70 = 2 * l_TextPadding_0 + 2;
    return v0.createElement("Frame", {
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        name = v0.createElement("TextLabel", {
            Text = l_axisLabelY_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Position = UDim2.new(l_Padding_0, 0, l_Padding_0, -l_TextPadding_0), 
            BackgroundTransparency = 1
        }), 
        minX = v0.createElement("TextLabel", {
            Text = not not l_stringFormatX_0 and l_stringFormatX_0(v37) or v37, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Position = UDim2.new(l_Padding_0, 0, l_Padding_0 + l_Scale_0, v70), 
            BackgroundTransparency = 1
        }), 
        maxX = v0.createElement("TextLabel", {
            Text = not not l_stringFormatX_0 and l_stringFormatX_0(v36) or v36, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Position = UDim2.new(l_Padding_0 + l_Scale_0, 0, l_Padding_0 + l_Scale_0, v70), 
            BackgroundTransparency = 1
        }), 
        axisLabelX = v0.createElement("TextLabel", {
            Text = l_axisLabelX_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Position = UDim2.new(0.5, 0, l_Padding_0 + l_Scale_0, v70), 
            BackgroundTransparency = 1
        }), 
        graph = v0.createElement("Frame", {
            Position = UDim2.new(l_Padding_0, 0, l_Padding_0, 0), 
            Size = UDim2.new(l_Scale_0, 0, l_Scale_0, 0), 
            BackgroundTransparency = 1, 
            [v0.Ref] = v22.graphRef, 
            [v0.Event.InputChanged] = v22.onGraphInputChanged, 
            [v0.Event.InputEnded] = v22.onGraphInputEnded
        }, v41)
    });
end;
return v14;
