local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_GameSettings_0 = UserSettings().GameSettings;
local v3 = require(l_CoreGui_0.RobloxGui.Modules.StyleWidgets);
local v4 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
LocalizedGetKey = function(v5)
    local l_v5_0 = v5;
    pcall(function()
        local _ = game:GetService("LocalizationService"):GetCorescriptLocalizations()[1];
        l_v5_0 = v4:FormatByKey(v5);
    end);
    return l_v5_0;
end;
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local _ = l_status_0 and l_result_0;
local v11 = {
    SelectedBackgroundColor = Color3.new(0.4, 0.4, 0.4), 
    FontColor = Color3.new(1, 1, 1), 
    GraphBarGreenColor = Color3.new(0.49411764705882355, 0.8274509803921568, 0.12941176470588237), 
    GraphBarYellowColor = Color3.new(0.8196078431372549, 0.8274509803921568, 0.12941176470588237), 
    GraphBarRedColor = Color3.new(0.8274509803921568, 0.34509803921568627, 0.12941176470588237), 
    GraphAverageLineColor = Color3.new(0.8156862745098039, 0.00392156862745098, 0.10588235294117647), 
    GraphAverageLineBorderColor = Color3.new(1, 1, 1), 
    NormalColor = Color3.fromRGB(31, 31, 31), 
    Transparency = 0.5, 
    MiniPanelTitleFontSize = Enum.FontSize.Size12, 
    MiniPanelValueFontSize = Enum.FontSize.Size10, 
    PanelTitleFontSize = Enum.FontSize.Size24, 
    PanelValueFontSize = Enum.FontSize.Size14, 
    PanelGraphFontSize = Enum.FontSize.Size10, 
    ButtonHeight = 36 + v3.TabSelectionHeight, 
    ViewerTopMargin = 10, 
    ViewerHeight = 144, 
    ViewerWidth = 306, 
    TextZIndex = 5, 
    GraphZIndex = 2, 
    GraphTargetLineInnerThickness = 2, 
    GraphAverageLineInnerThickness = 2, 
    GraphAverageLineBorderThickness = 1
};
v11.GraphAverageLineTotalThickness = v11.GraphAverageLineInnerThickness + 2 * v11.GraphAverageLineBorderThickness;
v11.TextPanelTitleHeightY = 52;
v11.TextPanelLegendItemHeightY = 20;
v11.TextPanelLeftMarginPix = 10;
v11.TextPanelTopMarginPix = 10;
v11.DecorationSize = 12;
v11.OvalKeySize = 8;
v11.TargetKeyWidth = 11;
v11.TargetKeyHeight = 2;
v11.DecorationMargin = 6;
v11.StatType_Memory = "st_Memory";
v11.StatType_CPU = "st_CPU";
v11.StatType_GPU = "st_GPU";
v11.StatType_NetworkSent = "st_NetworkSent";
v11.StatType_NetworkReceived = "st_NetworkReceived";
v11.StatType_Ping = "st_Ping";
v11.AllStatTypes = {
    v11.StatType_Memory, 
    v11.StatType_CPU, 
    v11.StatType_GPU, 
    v11.StatType_NetworkSent, 
    v11.StatType_NetworkReceived, 
    v11.StatType_Ping
};
v11.StatNames = {
    [v11.StatType_Memory] = "Memory", 
    [v11.StatType_CPU] = "CPU", 
    [v11.StatType_GPU] = "GPU", 
    [v11.StatType_NetworkSent] = "NetworkSent", 
    [v11.StatType_NetworkReceived] = "NetworkReceived", 
    [v11.StatType_Ping] = "Ping"
};
v11.StatMaxNames = {
    [v11.StatType_Memory] = "MaxMemory", 
    [v11.StatType_CPU] = "MaxCPU", 
    [v11.StatType_GPU] = "MaxGPU", 
    [v11.StatType_NetworkSent] = "MaxNetworkSent", 
    [v11.StatType_NetworkReceived] = "MaxNetworkReceived", 
    [v11.StatType_Ping] = "MaxPing"
};
v11.NumButtonTypes = #v11.AllStatTypes;
v11.TypeToName = {
    [v11.StatType_Memory] = "Memory", 
    [v11.StatType_CPU] = "CPU", 
    [v11.StatType_GPU] = "GPU", 
    [v11.StatType_NetworkSent] = LocalizedGetKey("Sent") .. "\n" .. LocalizedGetKey("Network"), 
    [v11.StatType_NetworkReceived] = LocalizedGetKey("Received") .. "\n" .. LocalizedGetKey("Network"), 
    [v11.StatType_Ping] = "Ping"
};
v11.TypeToShortName = {
    [v11.StatType_Memory] = "Mem", 
    [v11.StatType_CPU] = "CPU", 
    [v11.StatType_GPU] = "GPU", 
    [v11.StatType_NetworkSent] = "Sent", 
    [v11.StatType_NetworkReceived] = "Recv", 
    [v11.StatType_Ping] = "Ping"
};
v11.MemoryAnalyzerTypeToName = {
    HumanoidTexture = "Humanoid Textures", 
    HumanoidTextureOrphan = "Humanoid Textures (Unused)", 
    OtherTexture = "Other Textures", 
    OtherTextureOrphan = "Other Textures (Unused)", 
    CoreScript = "Core Scripts", 
    UserScript = "User Scripts", 
    Sounds = "Sounds", 
    CSG = "Solid Models", 
    Meshes = "Meshes"
};
v11.GetMemoryAnalyzerStatName = function(v12)
    if v11.MemoryAnalyzerTypeToName[v12] == nil then
        return v12;
    else
        return v11.MemoryAnalyzerTypeToName[v12];
    end;
end;
v11.StyleFrame = function(v13)
    v13.BackgroundColor3 = v11.NormalColor;
    v13.BackgroundTransparency = v11.Transparency;
end;
v11.StyleButton = function(v14)
    v14.BackgroundColor3 = v11.NormalColor;
    v14.BackgroundTransparency = v11.Transparency;
end;
v11.StyleTextWidget = function(v15)
    v15.BackgroundTransparency = 1;
    v15.TextColor3 = v11.FontColor;
    v15.Font = Enum.Font.SourceSansBold;
end;
v11.StyleButtonSelected = function(v16, v17)
    v11.StyleButton(v16);
    if v17 then
        v16.BackgroundColor3 = v11.SelectedBackgroundColor;
    end;
end;
local l_status_1, l_result_1 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v20 = l_status_1 and l_result_1;
local function _(v21, v22)
    pcall(function()
        local l_LocalizationService_0 = game:GetService("LocalizationService");
        v22 = l_LocalizationService_0:GetCorescriptLocalizations()[1]:GetString(l_LocalizationService_0.RobloxLocaleId, v21);
    end);
    return v22;
end;
v11.FormatTypedValue = function(v25, v26)
    if v20 then
        if not (v26 ~= v11.StatType_CPU) or v26 == v11.StatType_GPU then
            local l_gsub_0 = string.gsub;
            local v28 = string.format("%.2f MB", v25);
            local l_pcall_0 = pcall;
            local v30 = "StatsUtil.ms";
            local v31;
            do
                local l_v28_0 = v28;
                l_pcall_0(function()
                    local l_LocalizationService_1 = game:GetService("LocalizationService");
                    l_v28_0 = l_LocalizationService_1:GetCorescriptLocalizations()[1]:GetString(l_LocalizationService_1.RobloxLocaleId, v30);
                end);
                v31 = l_v28_0;
            end;
            return l_gsub_0(v31, "{RBX_NUMBER}", string.format("%.2f", v25));
        elseif not (v26 ~= v11.StatType_NetworkSent) or v26 == v11.StatType_NetworkReceived then
            local l_gsub_1 = string.gsub;
            local v35 = string.format("%.2f KB/s", v25);
            local l_pcall_1 = pcall;
            local v37 = "StatsUtil.KBps";
            local v38;
            do
                local l_v35_0 = v35;
                l_pcall_1(function()
                    local l_LocalizationService_2 = game:GetService("LocalizationService");
                    l_v35_0 = l_LocalizationService_2:GetCorescriptLocalizations()[1]:GetString(l_LocalizationService_2.RobloxLocaleId, v37);
                end);
                v38 = l_v35_0;
            end;
            return l_gsub_1(v38, "{RBX_NUMBER}", string.format("%.2f", v25));
        end;
    end;
    if v26 == v11.StatType_Memory then
        return string.format("%.2f MB", v25);
    elseif v26 == v11.StatType_CPU then
        return string.format("%.2f ms", v25);
    elseif v26 == v11.StatType_GPU then
        return string.format("%.2f ms", v25);
    elseif v26 == v11.StatType_NetworkSent then
        return string.format("%.2f KB/s", v25);
    elseif v26 == v11.StatType_NetworkReceived then
        return string.format("%.2f KB/s", v25);
    elseif v26 == v11.StatType_Ping then
        return string.format("%.2f ms", v25);
    else
        return ;
    end;
end;
v11.StyleAverageLine = function(v41)
    v41.BackgroundColor3 = v11.GraphAverageLineColor;
    v41.BorderSizePixel = v11.GraphAverageLineBorderThickness;
    v41.BorderColor3 = v11.GraphAverageLineBorderColor;
end;
v11.GetColorForValue = function(v42, v43)
    if v42 < 0.666 * v43 then
        return v11.GraphBarGreenColor;
    elseif v42 < 1.333 * v43 then
        return v11.GraphBarYellowColor;
    else
        return v11.GraphBarRedColor;
    end;
end;
v11.PerformanceStatsShouldBeVisible = function()
    return l_GameSettings_0.PerformanceStatsVisible and l_Players_0.LocalPlayer ~= nil;
end;
return v11;
