local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = pcall(function()
    game:GetService("ScriptProfilerService");
end);
local v4 = game:DefineFastFlag("ScriptProfilerUseNewAPI", false);
local l_ScriptContext_0 = game:GetService("ScriptContext");
local v6 = if not not v4 and v3 then game:GetService("ScriptProfilerService") else nil;
local _ = require(script.Parent.ProfilerDataFormatV2);
local v8 = require(script.Parent.Parent.Parent.Components.ScrollingTextBox);
local _ = script.Parent.Parent.Parent.Actions;
local v10 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v10.GeneralFormatting.MainRowPadding;
local l_MainWindowHeader_0 = v10.Font.MainWindowHeader;
local l_MainWindow_0 = v10.Font.MainWindow;
local l_ButtonTextSize_0 = v10.MicroProfilerFormatting.ButtonTextSize;
local l_UnselectedGray_0 = v10.Color.UnselectedGray;
local l_ButtonWidth_0 = v10.MicroProfilerFormatting.ButtonWidth;
local v17 = v1.PureComponent:extend("ProfilerExportView");
local function _(v18, v19, v20)
    local v21 = "";
    local v22 = not v18 and "server" or "client";
    local v23 = v19 and v19.SessionStartTime;
    if v23 then
        v21 = os.date("%Y%b%d-%H%M%S-", v23 / 1000) or "";
    end;
    return "scriptprofiler-" .. v21 .. v22 .. v20;
end;
v17.init = function(_)
end;
v17.didMount = function(v26)
    local v27 = {};
    local l_data_0 = v26.props.client.data;
    local v29 = "";
    local v30 = l_data_0 and l_data_0.SessionStartTime;
    if v30 then
        v29 = os.date("%Y%b%d-%H%M%S-", v30 / 1000) or "";
    end;
    v27.exportFilenameClient = "scriptprofiler-" .. v29 .. "client" .. ".json";
    l_data_0 = v26.props.server.data;
    v29 = "";
    v30 = l_data_0 and l_data_0.SessionStartTime;
    if v30 then
        v29 = os.date("%Y%b%d-%H%M%S-", v30 / 1000) or "";
    end;
    v27.exportFilenameServer = "scriptprofiler-" .. v29 .. "server" .. ".json";
    v26:setState(v27);
end;
v17.didUpdate = function(_)
end;
v17.renderExportInputAndButton = function(v32, v33, v34, v35)
    return v1.createElement("TextLabel", {
        Size = UDim2.new(0.9, 0, 0, 30), 
        Position = UDim2.new(0.05, 0, 0, 37.5), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_UnselectedGray_0, 
        Text = not v35 and "Complete a profiling session to export data" or "", 
        TextSize = l_ButtonTextSize_0, 
        Font = l_MainWindow_0, 
        TextColor3 = v10.Color.Text
    }, if not v35 then {} else {
        InputField = v1.createElement(v8, {
            Text = v34, 
            TextSize = l_ButtonTextSize_0, 
            Font = l_MainWindow_0, 
            Size = UDim2.new(0.8, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            ShowNativeInput = true, 
            TextColor3 = v10.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ClearTextOnFocus = false, 
            PlaceholderText = "Filename for export", 
            TextBoxFocusLost = function(v36, _, _)
                if not v33 then
                    v32:setState({
                        exportFilenameServer = v36.text
                    });
                    return ;
                else
                    v32:setState({
                        exportFilenameClient = v36.text
                    });
                    return ;
                end;
            end
        }), 
        ExportButton = v1.createElement("TextButton", {
            Size = UDim2.new(0.2, 0, 1, 0), 
            Position = UDim2.new(0.8, 0, 0, 0), 
            Text = "Export", 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v10.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_0, 
            [v1.Event.Activated] = function()
                local v39 = nil;
                v39 = if not v4 then l_ScriptContext_0:SaveScriptProfilingData(v35, v34) else v6:SaveScriptProfilingData(v35, v34);
                if not v33 then
                    v32:setState({
                        serverSavePath = v39
                    });
                    return ;
                else
                    v32:setState({
                        clientSavePath = v39
                    });
                    return ;
                end;
            end
        })
    });
end;
v17.renderExportSection = function(v40, v41, v42)
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    if not v41 then
        v43 = v40.state.exportFilenameServer;
        v44 = v40.props.server.serializedData;
        v45 = v40.state.serverSavePath;
    else
        v43 = v40.state.exportFilenameClient;
        v44 = v40.props.client.serializedData;
        v45 = v40.state.clientSavePath;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 90), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    }, {
        Label = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 0), 
            Text = v42, 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v10.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_0, 
            BackgroundTransparency = 1
        }), 
        HorizontalLine = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 0, 30)
        }), 
        Export = v40:renderExportInputAndButton(v41, v43, v44), 
        SavedPath = if v45 then v1.createElement("TextBox", {
            Size = UDim2.new(0.95, 0, 0, 30), 
            Position = UDim2.new(0.05, 0, 0, 75), 
            Text = "Saved to " .. v45, 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v10.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_0, 
            BackgroundTransparency = 1, 
            TextEditable = false, 
            ClearTextOnFocus = false
        }) else nil
    });
end;
v17.render = function(v46)
    return v1.createElement("Frame", {
        Size = v46.props.size, 
        BackgroundColor3 = v10.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0 * 2), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Row = v46:renderExportSection(true, "Client"), 
        HorizontalLine = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_MainRowPadding_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        Row2 = v46:renderExportSection(false, "Server")
    });
end;
return v2.UNSTABLE_connect2(function(v47, _)
    return {
        client = v47.ScriptProfiler.client, 
        server = v47.ScriptProfiler.server
    };
end, nil)(v17);
