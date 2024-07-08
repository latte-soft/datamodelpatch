local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local _ = game:GetService("ScriptContext");
local v4 = require(script.Parent.ProfilerUtil);
local v5 = require(script.Parent.Parent.Parent.Components.DropDown);
local v6 = require(script.Parent.Parent.Parent.Actions.SetScriptProfilerState);
local v7 = require(script.Parent.Parent.Parent.Constants);
local v8 = v7.GeneralFormatting.MainRowPadding * 2;
local l_SmallFrameHeight_0 = v7.UtilityBarFormatting.SmallFrameHeight;
local l_MainWindowHeader_0 = v7.Font.MainWindowHeader;
local l_MainWindow_0 = v7.Font.MainWindow;
local l_ButtonTextSize_0 = v7.MicroProfilerFormatting.ButtonTextSize;
local l_Text_0 = v7.Color.Text;
local _ = v7.Color.UnselectedGray;
local l_UnselectedGray_1 = v7.Color.UnselectedGray;
local l_SelectedBlue_0 = v7.Color.SelectedBlue;
local l_UnselectedGray_2 = v7.Color.UnselectedGray;
local l_ButtonWidth_0 = v7.MicroProfilerFormatting.ButtonWidth;
local l_DropDownArrowHeight_0 = v7.GeneralFormatting.DropDownArrowHeight;
local v20 = l_DropDownArrowHeight_0 / 2;
local l_DownArrow_0 = v7.Image.DownArrow;
local v22 = game:DefineFastFlag("ScriptProfilerHideGCOverhead2", false);
local v23 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false);
local _ = function(v24, v25)
    local v26 = table.create(#v24);
    for _, v28 in v24, nil, nil do
        table.insert(v26, v25(v28));
    end;
    return v26;
end;
local function v31(v30)
    if v30 == 0 then
        return "Off";
    else
        return v4.formatTimer(v30);
    end;
end;
local v32 = {
    "Callgraph", 
    "Functions"
};
local v33 = {
    0, 
    1, 
    60, 
    300, 
    600
};
local v34 = table.create(#v33);
for _, v36 in v33, nil, nil do
    table.insert(v34, v31(v36));
end;
local l_v34_0 = v34;
v34 = {
    1000, 
    10000
};
local l_formatFrequency_0 = v4.formatFrequency;
local v39 = table.create(#v34);
for _, v41 in v34, nil, nil do
    table.insert(v39, l_formatFrequency_0(v41));
end;
local l_v39_0 = v39;
l_formatFrequency_0 = {
    0, 
    60, 
    300, 
    600
};
local v43 = table.create(#l_formatFrequency_0);
for _, v45 in l_formatFrequency_0, nil, nil do
    table.insert(v43, v31(v45));
end;
v39 = v43;
v43 = v1.PureComponent:extend("MobileSettingsView");
v43.init = function(_)
end;
v43.didMount = function(_)
end;
v43.didUpdate = function(_)
end;
v43.GetState = function(v49, v50)
    return (if not v49.props.isClientView then v49.props.server else v49.props.client)[v50];
end;
v43.UpdateState = function(v51, v52, v53)
    local v54 = table.clone(if not v51.props.isClientView then v51.props.server else v51.props.client);
    v54[v52] = v53;
    v51.props.dispatchSetScriptProfilerState(v51.props.isClientView, v54);
end;
v43.renderToggle = function(_, v56, v57, v58)
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_SmallFrameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    }, {
        Label = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, l_SmallFrameHeight_0), 
            Position = UDim2.new(0.1, 0, 0, 0), 
            Text = v56, 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v7.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_2, 
            BackgroundTransparency = 1
        }), 
        ToggleButton = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0 * 2, 0, l_SmallFrameHeight_0), 
            Position = UDim2.new(0.9, -l_ButtonWidth_0 * 2, 0, 0), 
            BackgroundTransparency = 1
        }, {
            OffButton = v1.createElement("TextButton", {
                Size = UDim2.new(0.5, 0, 1, 0), 
                Text = "Off", 
                Font = l_MainWindowHeader_0, 
                TextSize = l_ButtonTextSize_0, 
                TextColor3 = v7.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundColor3 = not not v57 and l_UnselectedGray_1 or l_SelectedBlue_0, 
                [v1.Event.Activated] = function()
                    v58(false);
                end
            }), 
            OnButton = v1.createElement("TextButton", {
                Size = UDim2.new(0.5, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                Text = "On", 
                Font = l_MainWindowHeader_0, 
                TextSize = l_ButtonTextSize_0, 
                TextColor3 = v7.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundColor3 = not not v57 and l_SelectedBlue_0 or l_UnselectedGray_1, 
                [v1.Event.Activated] = function()
                    v58(true);
                end
            })
        })
    });
end;
v43.renderStateToggle = function(v59, v60, v61, _)
    return v59:renderToggle(v60, v59:GetState(v61), function(v63)
        v59:UpdateState(v61, v63);
    end);
end;
v43.renderDropDown = function(v64, v65, v66, v67, v68, v69, v70)
    local _ = nil;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_SmallFrameHeight_0), 
        BackgroundTransparency = 1
    }, {
        Label = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, l_SmallFrameHeight_0), 
            Position = UDim2.new(0.1, 0, 0, 0), 
            Text = v65, 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v7.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_2, 
            BackgroundTransparency = 1
        }), 
        DropDown = if not v70 then v1.createElement("Frame", {
            Position = UDim2.new(0.9, -l_ButtonWidth_0, 0, 0), 
            Size = UDim2.new(0, l_ButtonWidth_0, 0, l_SmallFrameHeight_0)
        }, {
            Selection = v1.createElement(v5, {
                buttonSize = UDim2.new(1, 0, 0, l_SmallFrameHeight_0), 
                dropDownList = v67, 
                selectedIndex = v69, 
                onSelection = function(v72)
                    local l_v64_State_0 = v64:GetState(v66);
                    if typeof(l_v64_State_0) == "boolean" then
                        l_v64_State_0 = v72 == 2;
                    elseif typeof(l_v64_State_0) == "number" then
                        l_v64_State_0 = v68[v72];
                    end;
                    v64:UpdateState(v66, l_v64_State_0);
                end
            })
        }) else v1.createElement("TextButton", {
            Position = UDim2.new(0.9, -l_ButtonWidth_0, 0, 0), 
            Size = UDim2.new(0, l_ButtonWidth_0, 0, l_SmallFrameHeight_0), 
            Text = v67[v69], 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = l_Text_0, 
            Font = l_MainWindow_0, 
            AutoButtonColor = true, 
            BackgroundColor3 = v7.Color.InactiveBox, 
            BackgroundTransparency = 0
        }, {
            arrow = v1.createElement("ImageLabel", {
                Image = l_DownArrow_0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_DropDownArrowHeight_0, 0, l_DropDownArrowHeight_0), 
                Position = UDim2.new(1, -l_DropDownArrowHeight_0 - v20, 0.5, -v20)
            })
        })
    });
end;
v43.render = function(v74)
    local l_v74_State_0 = v74:GetState("isProfiling");
    return v1.createElement("ScrollingFrame", {
        Size = v74.props.size, 
        BackgroundColor3 = v7.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, v8), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Percentages = v74:renderToggle("Percentages", v74.props.usePercentages, function(v76)
            v74.props.dispatchSetScriptProfilerUsePercentages(v76);
        end), 
        LiveToggle = v74:renderStateToggle("Live Update", "liveUpdate"), 
        PluginsToggle = if v23 then v74:renderStateToggle("Show Plugins", "showPlugins") else nil, 
        GCToggle = if v22 then v74:renderStateToggle("GC Overhead", "showGc") else nil, 
        AverageDropDown = v74:renderDropDown("Average", "average", l_v34_0, v33, table.find(v33, v74:GetState("average")) or 1), 
        FrequencyDropDown = v74:renderDropDown("Frequency", "frequency", l_v39_0, v34, table.find(v34, v74:GetState("frequency")) or 1, l_v74_State_0), 
        TimerDropDown = v74:renderDropDown("Timer" .. (not l_v74_State_0 and "" or ": " .. v4.formatTimer(v74:GetState("timedProfilingCountdown"))), "timedProfilingDuration", v39, l_formatFrequency_0, table.find(l_formatFrequency_0, v74:GetState("timedProfilingDuration")) or 1, l_v74_State_0), 
        ViewDropDown = v74:renderDropDown("View", "isFunctionsView", v32, nil, not v74:GetState("isFunctionsView") and 1 or 2)
    });
end;
return v2.UNSTABLE_connect2(function(v77, _)
    return {
        usePercentages = v77.ScriptProfiler.usePercentages, 
        isClientView = v77.ScriptProfiler.isClientView, 
        client = v77.ScriptProfiler.client, 
        server = v77.ScriptProfiler.server
    };
end, function(v79)
    return {
        dispatchSetScriptProfilerState = function(v80, v81)
            if not v80 then
                v79(v6(v80, nil, nil, v81));
                return ;
            else
                v79(v6(v80, nil, v81, nil));
                return ;
            end;
        end, 
        dispatchSetScriptProfilerUsePercentages = function(v82)
            v79(v6(nil, v82));
        end
    };
end)(v43);
