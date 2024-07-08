local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = pcall(function()
    game:GetService("ScriptProfilerService");
end);
local v4 = game:DefineFastFlag("ScriptProfilerUseNewAPI", false);
local l_ScriptContext_0 = game:GetService("ScriptContext");
local v6 = if not not v4 and v3 then game:GetService("ScriptProfilerService") else nil;
local _ = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v9 = require(script.Parent.Parent.Parent.Immutable);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v11 = require(l_Components_0.DataConsumer);
local v12 = require(l_Components_0.UtilAndTab);
local v13 = require(l_Components_0.BoxButton);
local v14 = require(l_Components_0.DropDown);
local v15 = require(script.Parent.ProfilerView);
local v16 = require(script.Parent.ProfilerFunctionsView);
local _ = require(script.Parent.ProfilerDataFormatV2);
local v18 = require(script.Parent.ProfilerExportView);
local v19 = require(script.Parent.MobileSettingsView);
local v20 = require(script.Parent.ProfilerUtil);
local l_getPluginFlag_0 = v20.getPluginFlag;
local l_getDurations_0 = v20.getDurations;
local l_formatFrequency_0 = v20.formatFrequency;
local v24 = require(script.Parent.Parent.Parent.Actions.SetScriptProfilerState);
local v25 = require(script.Parent.Actions.SetIsProfiling);
local v26 = require(script.Parent.Actions.SetData);
local v27 = require(script.Parent.Actions.SetThreads);
local v28 = require(script.Parent.Actions.SetTimerState);
local v29 = require(script.Parent.Actions.ClearStateForNewProfilingSession);
local v30 = require(script.Parent.Actions.SetAverage);
local v31 = require(script.Parent.Actions.SetFrequency);
local v32 = require(script.Parent.Actions.SetDataView);
local v33 = require(script.Parent.Actions.SetLiveUpdate);
local v34 = require(script.Parent.Actions.SetShowPlugins);
local v35 = require(script.Parent.Actions.SetShowGC);
local v36 = require(script.Parent.Actions.SetSearchData);
local v37 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v37.GeneralFormatting.MainRowPadding;
local l_SmallFrameHeight_0 = v37.UtilityBarFormatting.SmallFrameHeight;
local l_MainWindowHeader_0 = v37.Font.MainWindowHeader;
local l_MainWindowHeader_1 = v37.DefaultFontSize.MainWindowHeader;
local l_Text_0 = v37.Color.Text;
local l_UnselectedGray_0 = v37.Color.UnselectedGray;
local v44 = v1.PureComponent:extend("MainViewScriptProfiler");
local v45 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v46 = game:DefineFastFlag("ScriptProfilerFunctionsViewUseSourceInfoForAnon", false);
local v47 = game:DefineFastFlag("ScriptProfilerRememberExpandedNodes2", false);
local v48 = game:DefineFastFlag("ScriptProfilerMobileSettingsUI", false);
local v49 = game:DefineFastFlag("ScriptProfilerHideGCOverhead2", false);
local v50 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false);
local v51 = game:DefineFastFlag("ScriptProfilerSimpleUI", false);
local v52 = game:DefineFastFlag("ScriptProfilerExport", false);
local v53 = game:DefineFastFlag("ScriptProfilerBetterStateManagement", false);
local v54 = game:DefineFastInt("ScriptProfilerLiveUpdateIntervalMS", 1000);
local v55 = {
    "Callgraph", 
    "Functions"
};
local function v56(v57, v58, v59, v60, v61, v62)
    local v63 = v57.Nodes[v61];
    if v63.Children then
        local l_Children_0 = v63.Children;
        local v65 = false;
        if not (v60 > 0) or not v58[v60] then
            for v66, v67 in pairs(l_Children_0) do
                v65 = v65 or v56(v57, v58, v59, v66, v67, v62);
            end;
            if not (not v65 and not v62) then
                v59[v61] = true;
            end;
            return v65;
        else
            v65 = true;
            v59[v61] = true;
            for v68, v69 in pairs(l_Children_0) do
                v59[v69] = true;
                v56(v57, v58, v59, v68, v69, true);
            end;
            return v65;
        end;
    else
        v59[v61] = v60 > 0 and v58[v60] or v62;
        local v70 = false;
        if v60 > 0 then
            v70 = v58[v60];
        end;
        return v70;
    end;
end;
local function v84(v71, v72)
    if v72 == "" then
        return nil, nil;
    else
        local l_data_0 = v71.data;
        if l_data_0 then
            local v74 = table.create(#l_data_0.Functions, false);
            for v75, v76 in l_data_0.Functions, nil, nil do
                local v77 = v20.getName(l_data_0, v76);
                if not (not v77 or not string.find(v77, v72, 1, true)) then
                    v74[v75] = true;
                end;
            end;
            local v78 = table.create(#l_data_0.Nodes, false);
            for _, v80 in l_data_0.Categories, nil, nil do
                v56(l_data_0, v74, v78, 0, v80.NodeId, false);
            end;
            if v46 then
                for v81, v82 in l_data_0.Functions, nil, nil do
                    if not (not (v74[v81] ~= true) or v20.getName(l_data_0, v82)) then
                        local v83 = v20.getSourceName(l_data_0, v82);
                        if not (not v83 or not string.find(v83, v72, 1, true)) then
                            v74[v81] = true;
                        end;
                    end;
                end;
            end;
            return v74, v78;
        else
            return nil, nil;
        end;
    end;
end;
local function v100(v85, v86)
    if not v86 then
        return {}, {};
    else
        assert(v86.Version == 2);
        local v87 = table.create(#v86.Categories, 0);
        local v88 = table.create(#v86.Categories, 0);
        local v89 = 0;
        local v90 = 0;
        for v91, v92 in v86.Categories, nil, nil do
            local v93 = v86.Nodes[v92.NodeId];
            local v94 = 0;
            local v95 = 0;
            local l_Children_1 = v93.Children;
            if l_Children_1 then
                for v97, v98 in pairs(l_Children_1) do
                    local _ = v86.Functions[v97];
                    if l_getPluginFlag_0(v86, v86.Functions[v97]) then
                        v94 = v94 + l_getDurations_0(v86, v98);
                        if v49 and #v85 > 0 then
                            v95 = v95 + v85[v98];
                        end;
                    end;
                end;
            end;
            v87[v91] = v94;
            v88[v91] = v95;
            v89 = v89 + v94;
            v90 = v90 + v95;
        end;
        v87.Total = v89;
        v88.Total = v89;
        return v87, v88;
    end;
end;
local function v101(v102, v103, v104, v105, v106)
    local v107 = v104.Nodes[v105];
    local v108 = 0;
    if v107.Children then
        for v109, v110 in pairs(v107.Children) do
            local v111 = nil;
            v111 = if v109 == v106 then v104.Nodes[v110].TotalDuration else v101(v102, v103, v104, v110, v106);
            v102[v109] = v102[v109] + v111;
            v103[v110] = v111;
            v108 = v108 + v111;
        end;
    end;
    return v108;
end;
local function v121(v112)
    if not v112 or not v112.GCFuncId then
        return {}, {};
    else
        local l_GCFuncId_0 = v112.GCFuncId;
        local v114 = table.create(#v112.Functions, 0);
        local v115 = table.create(#v112.Nodes, 0);
        local v116 = 0;
        for _, v118 in v112.Categories, nil, nil do
            local l_NodeId_0 = v118.NodeId;
            local v120 = v101(v114, v115, v112, l_NodeId_0, l_GCFuncId_0);
            v116 = v116 + v120;
            v115[l_NodeId_0] = v120;
        end;
        v115.Total = v116;
        return v114, v115;
    end;
end;
v44.getActiveState = function(v122)
    local l_isClientView_0 = v122.props.isClientView;
    if not v122.props.isClientView then
        return l_isClientView_0, v122.props.server;
    else
        return l_isClientView_0, v122.props.client;
    end;
end;
v44.getState = function(v124, v125)
    if not v125 then
        return v124.props.server;
    else
        return v124.props.client;
    end;
end;
v44.UpdateState = function(v126, v127, v128)
    if not v127 then
        v126.props.dispatchSetScriptProfilerState(nil, nil, nil, v128);
        return ;
    else
        v126.props.dispatchSetScriptProfilerState(nil, nil, v128, nil);
        return ;
    end;
end;
local function v139(v129, v130, v131)
    v129.serializedData = v131;
    if not v4 then
        v129.data = l_ScriptContext_0:DeserializeScriptProfilerString(v131);
    else
        v129.data = v6:DeserializeJSON(v131);
    end;
    if v49 then
        local v132, v133 = v121(v129.data);
        v129.gcFunctionOffsets = v132;
        v129.gcNodeOffsets = v133;
    end;
    if v50 then
        local v134, v135 = v100(v129.gcNodeOffsets, v129.data);
        v129.pluginOffsets = v134;
        v129.pluginGCOffsets = v135;
    end;
    if v47 then
        local v136 = not v129.data and 0 or #v129.data.Nodes;
        local v137 = not v130.data and 0 or #v130.data.Nodes;
        local v138 = table.create(v136, false);
        table.move(v130.expandedNodes, 1, v137, 1, v138);
        v129.expandedNodes = v138;
    end;
end;
v44.init = function(v140)
    local function v144(v141, v142)
        if not v53 then
            table.clear(v142.expandedNodes);
        end;
        if not v4 then
            if not v141 then
                local v143 = v45();
                if v143 then
                    v143:RequestServerScriptProfiling(true, v142.frequency);
                end;
                return ;
            else
                l_ScriptContext_0:StartScriptProfiling(v142.frequency);
                return ;
            end;
        elseif not v141 then
            v6:ServerStart(v142.frequency);
            return ;
        else
            v6:ClientStart(l_Players_0.LocalPlayer, v142.frequency);
            return ;
        end;
    end;
    local function v147(v145)
        if not v4 then
            if not v145 then
                local v146 = v45();
                if v146 then
                    v146:RequestServerScriptProfiling(false);
                end;
                return nil;
            else
                return (l_ScriptContext_0:StopScriptProfiling());
            end;
        else
            if not v145 then
                v6:ServerStop();
            else
                v6:ClientStop(l_Players_0.LocalPlayer);
            end;
            return nil;
        end;
    end;
    local function v149(v148)
        if v4 then
            if not v53 then
                task.delay(0.1, function()
                    if not v148 then
                        v6:ServerRequestData();
                        return ;
                    else
                        v6:ClientRequestData(l_Players_0.LocalPlayer);
                        return ;
                    end;
                end);
                return ;
            elseif not v148 then
                v6:ServerRequestData();
                return ;
            else
                v6:ClientRequestData(l_Players_0.LocalPlayer);
                return ;
            end;
        else
            return ;
        end;
    end;
    local function v155(v150)
        local v151 = v140:getState(v150);
        if v151.isProfiling then
            local v152 = v147(v150);
            if not v53 then
                local v153 = table.clone(v151);
                v153.isProfiling = false;
                if not v4 then
                    v139(v153, v153, v152);
                end;
                v140:UpdateState(v150, v153);
            else
                v140.props.dispatchSetIsProfiling(v150, false);
                if not v4 then
                    local v154 = {};
                    v139(v154, v151, v152);
                    v140.props.dispatchSetData(v150, v154);
                end;
            end;
            v149(v150);
        end;
    end;
    v140.onUtilTabHeightChanged = function(v156)
        v140:setState({
            utilTabHeight = v156
        });
    end;
    local function v161(v157)
        while task.wait(0.5) do
            local v158 = v140:getState(v157);
            local l_timedProfilingCountdown_0 = v158.timedProfilingCountdown;
            if l_timedProfilingCountdown_0 > 0 then
                if not v53 then
                    local v160 = table.clone(v158);
                    v160.timedProfilingCountdown = l_timedProfilingCountdown_0 - 0.5;
                    v140:UpdateState(v157, v160);
                else
                    v140.props.dispatchSetTimer(v157, {
                        timedProfilingCountdown = l_timedProfilingCountdown_0 - 0.5
                    });
                end;
            else
                break;
            end;
        end;
    end;
    local function v167(v162)
        while task.wait(v54 / 1000) do
            local v163 = v140:getState(v162);
            if v163.liveUpdate then
                if not v4 then
                    if not v162 then
                        local v164 = v45();
                        if v164 then
                            v164:RequestServerScriptProfilingData();
                        end;
                    elseif not v53 then
                        local v165 = table.clone(v163);
                        v139(v165, v165, (l_ScriptContext_0:GetScriptProfilingData()));
                        v140:UpdateState(v162, v165);
                    else
                        local v166 = {};
                        v139(v166, v163, (l_ScriptContext_0:GetScriptProfilingData()));
                        v140.props.dispatchSetData(v162, v166);
                    end;
                else
                    v149(v162);
                end;
            end;
        end;
    end;
    v140.onBeginProfile = function()
        local v168, v169 = v140:getActiveState();
        v144(v168, v169);
        if not v53 then
            local v170 = table.clone(v169);
            v170.isProfiling = true;
            v170.rootNode = 0;
            v170.rootFunc = 0;
            v170.rootNodeName = nil;
            v170.searchFilter = {};
            if v169.timedProfilingDuration > 0 then
                v170.timedProfilingCountdown = v169.timedProfilingDuration;
                v170.timedProfilingThread = task.delay(v169.timedProfilingDuration, function()
                    v155(v168);
                end);
                v170.timedProfilingTimerThread = task.spawn(function()
                    v161(v168);
                end);
            end;
            v170.liveUpdateThread = task.spawn(v167, v168);
            v140:UpdateState(v168, v170);
            return ;
        else
            v140.props.dispatchSetIsProfiling(v168, true);
            v140.props.dispatchClearStateForNewSession(v168);
            local v171 = {};
            if v169.timedProfilingDuration > 0 then
                v140.props.dispatchSetTimer(v168, {
                    timedProfilingCountdown = v169.timedProfilingDuration
                });
                v171.timedProfilingThread = task.delay(v169.timedProfilingDuration, function()
                    v155(v168);
                end);
                v171.timedProfilingTimerThread = task.spawn(function()
                    v161(v168);
                end);
            end;
            v171.liveUpdateThread = task.spawn(v167, v168);
            v140.props.dispatchSetThreads(v168, v171);
            return ;
        end;
    end;
    v140.onEndProfile = function()
        local v172, v173 = v140:getActiveState();
        local v174 = v147(v172);
        local v175 = nil;
        if not v53 then
            v175 = table.clone(v173);
            v175.isProfiling = false;
        else
            v175 = {};
        end;
        if not v4 then
            v139(v175, v175, v174);
        end;
        if v173.timedProfilingThread then
            task.cancel(v173.timedProfilingThread);
            v175.timedProfilingThread = nil;
        end;
        if v173.timedProfilingTimerThread then
            task.cancel(v173.timedProfilingTimerThread);
            v175.timedProfilingTimerThread = nil;
        end;
        if v173.liveUpdateThread then
            task.cancel(v173.liveUpdateThread);
            v175.liveUpdateThread = nil;
        end;
        if not v53 then
            v140:UpdateState(v172, v175);
        else
            v140.props.dispatchSetThreads(v172, {});
            v140.props.dispatchSetIsProfiling(v172, false);
            if not v4 then
                v140.props.dispatchSetData(v172, v175);
            end;
        end;
        v149(v172);
    end;
    v140.toggleTimedProfiling = function()
        local v176, v177 = v140:getActiveState();
        local l_timedProfilingDuration_0 = v177.timedProfilingDuration;
        l_timedProfilingDuration_0 = l_timedProfilingDuration_0 == 0 and 60 or (l_timedProfilingDuration_0 == 60 and 300 or (l_timedProfilingDuration_0 == 300 and 600 or 0));
        if not v53 then
            local v179 = table.clone(v177);
            v179.timedProfilingDuration = l_timedProfilingDuration_0;
            v140:UpdateState(v176, v179);
            return ;
        else
            v140.props.dispatchSetTimer(v176, {
                timedProfilingDuration = l_timedProfilingDuration_0
            });
            return ;
        end;
    end;
    v140.toggleAverage = function()
        local v180, v181 = v140:getActiveState();
        local l_average_0 = v181.average;
        l_average_0 = l_average_0 == 0 and 1 or (l_average_0 == 1 and 60 or (l_average_0 == 60 and 300 or (l_average_0 == 300 and 600 or 0)));
        if not v53 then
            local v183 = table.clone(v181);
            v183.average = l_average_0;
            v140:UpdateState(v180, v183);
            return ;
        else
            v140.props.dispatchSetAverage(v180, l_average_0);
            return ;
        end;
    end;
    v140.toggleUnits = function()
        v140.props.dispatchSetScriptProfilerState(nil, not v140.props.usePercentages, nil, nil);
    end;
    v140.toggleFrequency = function()
        local v184, v185 = v140:getActiveState();
        local v186 = v185.frequency == 1000 and 10000 or 1000;
        if not v53 then
            local v187 = table.clone(v185);
            v187.frequency = v186;
            v140:UpdateState(v184, v187);
            return ;
        else
            v140.props.dispatchSetFrequency(v184, v186);
            return ;
        end;
    end;
    v140.onClientButton = function()
        v140.props.dispatchSetScriptProfilerState(true);
    end;
    v140.onServerButton = function()
        v140.props.dispatchSetScriptProfilerState(false);
    end;
    v140.dataViewDropDownCallback = function(v188)
        local v189, v190 = v140:getActiveState();
        if not v53 then
            local v191 = table.clone(v190);
            if v188 == 1 then
                v191.isFunctionsView = false;
            elseif v188 == 2 then
                v191.isFunctionsView = true;
            end;
            v140:UpdateState(v189, v191);
            return ;
        else
            local l_isFunctionsView_0 = v190.isFunctionsView;
            if v188 == 1 then
                l_isFunctionsView_0 = false;
            elseif v188 == 2 then
                l_isFunctionsView_0 = true;
            end;
            v140.props.dispatchSetDataView(v189, l_isFunctionsView_0);
            return ;
        end;
    end;
    v140.onCheckBoxChanged = function(v193, v194)
        if not v53 then
            local v195, v196 = v140:getActiveState();
            local v197 = table.clone(v196);
            if v193 == "Live" then
                v197.liveUpdate = v194;
            elseif v193 == "Plugins" then
                v197.showPlugins = v194;
            elseif v193 == "GC" then
                v197.showGC = v194;
            end;
            v140:UpdateState(v195, v197);
        else
            local l_isClientView_1 = v140.props.isClientView;
            if v193 == "Live" then
                v140.props.dispatchSetLiveUpdate(l_isClientView_1, v194);
                return ;
            elseif v193 == "Plugins" then
                v140.props.dispatchSetShowPlugins(l_isClientView_1, v194);
                return ;
            elseif v193 == "GC" then
                v140.props.dispatchSetShowGC(l_isClientView_1, v194);
                return ;
            end;
        end;
    end;
    v140.onSearchTermChanged = function(v199)
        local v200, v201 = v140:getActiveState();
        if not v53 then
            local v202 = table.clone(v201);
            v202.searchTerm = v199;
            local v203, v204 = v84(v201, v199);
            v202.searchFilterFlat = v203 or {};
            v202.searchFilterGraph = v204 or {};
            v140:UpdateState(v200, v202);
            return ;
        else
            local v205, v206 = v84(v201, v199);
            v140.props.dispatchSetSearchData(v200, {
                searchTerm = v199, 
                searchFilterFlat = v205 or {}, 
                searchFilterGraph = v206 or {}
            });
            return ;
        end;
    end;
    v140.utilRef = v1.createRef();
    v140.state = {
        utilTabHeight = 0, 
        showSimpleUI = not v48 and true or nil
    };
end;
v44.didMount = function(v207)
    v207:setState({
        utilTabHeight = v207.utilRef.current.Size.Y.Offset
    });
    if not v4 then
        v207.statsConnector = v207.props.ServerProfilingData:Signal():Connect(function(v208)
            if not v53 then
                local v209 = table.clone(v207.props.server);
                v139(v209, v209, v208);
                v207:UpdateState(false, v209);
                return ;
            else
                local v210 = v207:getState(false);
                local v211 = {};
                v139(v211, v210, v208);
                v207.props.dispatchSetData(false, v211);
                return ;
            end;
        end);
        return ;
    elseif v3 then
        v207.scriptProfilerConnection = v6.OnNewData:Connect(function(v212, v213)
            local v214 = v212 ~= nil;
            if not v53 then
                local v215 = table.clone(v207:getState(v214));
                v139(v215, v215, v213);
                v207:UpdateState(v214, v215);
                return ;
            else
                local v216 = v207:getState(v214);
                local v217 = {};
                v139(v217, v216, v213);
                v207.props.dispatchSetData(v214, v217);
                return ;
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v44.willUnmount = function(v218)
    if not v4 then
        v218.statsConnector:Disconnect();
        v218.statsConnector = nil;
        return ;
    elseif v3 then
        v218.scriptProfilerConnection:Disconnect();
        v218.scriptProfilerConnection = nil;
        return ;
    else
        return ;
    end;
end;
v44.didUpdate = function(v219)
    local l_Size_0 = v219.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v219.state.utilTabHeight then
        v219:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
local function _(v221)
    local v222 = v20.formatTimer(v221);
    if v222 ~= "" then
        return ": " .. v222;
    else
        return v222;
    end;
end;
v44.renderUtilButtons = function(v224, v225, v226, v227)
    local l_isProfiling_0 = v225.isProfiling;
    local v229 = {};
    table.insert(v229, v1.createElement(v13, {
        text = not l_isProfiling_0 and "Start" or "Stop", 
        onClicked = not not l_isProfiling_0 and v224.onEndProfile or v224.onBeginProfile
    }));
    if not v227 then
        table.insert(v229, v1.createElement(v13, {
            text = not v224.props.usePercentages and "Unit: ms" or "Unit: %", 
            onClicked = v224.toggleUnits
        }));
    end;
    if not v227 then
        table.insert(v229, v1.createElement("TextButton", {
            Text = "Freq: " .. l_formatFrequency_0(v225.frequency), 
            TextSize = l_MainWindowHeader_1, 
            TextColor3 = l_Text_0, 
            Font = l_MainWindowHeader_0, 
            AutoButtonColor = true, 
            BackgroundColor3 = if not l_isProfiling_0 then l_UnselectedGray_0 else v37.Color.InactiveBox, 
            BackgroundTransparency = 0, 
            [v1.Event.Activated] = function()
                if not l_isProfiling_0 then
                    v224.toggleFrequency();
                end;
            end
        }));
    end;
    if not v227 then
        local l_v229_0 = v229;
        local l_createElement_0 = v1.createElement;
        local v232 = "TextButton";
        local v233 = {};
        local v234 = "Time";
        local v235 = v20.formatTimer(if not l_isProfiling_0 then v225.timedProfilingDuration else v225.timedProfilingCountdown);
        v233.Text = v234 .. if v235 ~= "" then ": " .. v235 else v235;
        v233.TextSize = l_MainWindowHeader_1;
        v233.TextColor3 = l_Text_0;
        v233.Font = l_MainWindowHeader_0;
        v233.AutoButtonColor = true;
        v233.BackgroundColor3 = if not l_isProfiling_0 then l_UnselectedGray_0 else v37.Color.InactiveBox;
        v233.BackgroundTransparency = 0;
        v233[v1.Event.Activated] = function()
            if not l_isProfiling_0 then
                v224.toggleTimedProfiling();
            end;
        end;
        table.insert(l_v229_0, l_createElement_0(v232, v233));
    end;
    if not v227 then
        local l_v229_1 = v229;
        local l_createElement_1 = v1.createElement;
        local v238 = "TextButton";
        local v239 = {};
        local v240 = "Average";
        local v241 = v20.formatTimer(v225.average);
        v239.Text = v240 .. if v241 ~= "" then ": " .. v241 else v241;
        v239.TextSize = l_MainWindowHeader_1;
        v239.TextColor3 = l_Text_0;
        v239.Font = l_MainWindowHeader_0;
        v239.AutoButtonColor = true;
        v239.BackgroundColor3 = if not l_isProfiling_0 then l_UnselectedGray_0 else v37.Color.InactiveBox;
        v239.BackgroundTransparency = 0;
        v239[v1.Event.Activated] = function()
            if not l_isProfiling_0 then
                v224.toggleAverage();
            end;
        end;
        table.insert(l_v229_1, l_createElement_1(v238, v239));
    end;
    if not (not v52 or v227) then
        table.insert(v229, v1.createElement(v13, {
            text = "Export", 
            onClicked = v224.props.dispatchStartExport
        }));
    end;
    if not v227 then
        table.insert(v229, v1.createElement(v14, {
            buttonSize = UDim2.new(0, 100, 0, l_SmallFrameHeight_0), 
            dropDownList = v55, 
            selectedIndex = not v225.isFunctionsView and 1 or 2, 
            onSelection = v224.dataViewDropDownCallback
        }));
    end;
    if v226 then
        table.insert(v229, v1.createElement(v13, {
            text = (v227 or v48) and "More..." or "Less...", 
            onClicked = function()
                if not v48 then
                    v224:setState({
                        showSimpleUI = not v224.state.showSimpleUI
                    });
                    return ;
                else
                    v224.props.dispatchShowMobileSettings();
                    return ;
                end;
            end
        }));
    end;
    return v229;
end;
v44.renderUtilAndTab = function(v242, v243, v244)
    return v1.createElement(v12, v9.JoinDictionaries({
        windowWidth = v242.props.size.X.Offset, 
        formFactor = v242.props.formFactor, 
        tabList = v242.props.tabList, 
        layoutOrder = 1, 
        refForParent = v242.utilRef, 
        onHeightChanged = v242.onUtilTabHeightChanged
    }, v243), v244);
end;
v44.renderExportView = function(v245)
    return v1.createElement("Frame", {
        Size = v245.props.size, 
        BackgroundColor3 = v37.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v245:renderUtilAndTab({}, {
            v1.createElement(v13, {
                text = "Exit", 
                onClicked = v245.props.dispatchFinishedExporting
            })
        }), 
        ExportView = v1.createElement(v18, {
            size = UDim2.new(1, 0, 1, -v245.state.utilTabHeight)
        })
    });
end;
v44.renderMobileSettingsUI = function(v246)
    return v1.createElement("Frame", {
        Size = v246.props.size, 
        BackgroundColor3 = v37.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v246:renderUtilAndTab({}, {
            v1.createElement(v13, {
                text = "Export", 
                onClicked = v246.props.dispatchStartExport
            }), 
            v1.createElement(v13, {
                text = "Exit", 
                onClicked = v246.props.dispatchHideMobileSettings
            })
        }), 
        MobileSettingsView = v1.createElement(v19, {
            size = UDim2.new(1, 0, 1, -v246.state.utilTabHeight)
        })
    });
end;
v44.renderProfilerView = function(v247, v248, v249, v250, v251)
    local l_isProfiling_1 = v249.isProfiling;
    local l_data_1 = v249.data;
    local l_usePercentages_0 = v247.props.usePercentages;
    local l_isFunctionsView_1 = v249.isFunctionsView;
    local l_rootNode_0 = v249.rootNode;
    local l_rootNodeName_0 = v249.rootNodeName;
    local l_rootFunc_0 = v249.rootFunc;
    local l_size_0 = v247.props.size;
    local l_utilTabHeight_0 = v247.state.utilTabHeight;
    local v261 = nil;
    if not ((not l_data_1 or not l_data_1.SessionStartTime) or not l_data_1.SessionEndTime) then
        v261 = l_data_1.SessionEndTime - l_data_1.SessionStartTime;
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v37.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v247:renderUtilAndTab({
            isClientView = v248, 
            onClientButton = v247.onClientButton, 
            onServerButton = v247.onServerButton, 
            orderedCheckBoxState = v251, 
            onCheckBoxChanged = v247.onCheckBoxChanged, 
            onSearchTermChanged = v247.onSearchTermChanged, 
            searchTerm = v249.searchTerm
        }, v250), 
        ProfilerView = v1.createElement(if not l_isFunctionsView_1 then v15 else v16, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            searchFilter = if not l_isFunctionsView_1 then v249.searchFilterGraph else v249.searchFilterFlat, 
            layoutOrder = 2, 
            data = l_data_1, 
            profiling = l_isProfiling_1, 
            showAsPercentages = l_usePercentages_0, 
            sessionLength = v261, 
            rootNode = l_rootNode_0, 
            rootFunc = l_rootFunc_0, 
            rootNodeName = l_rootNodeName_0, 
            average = v249.average, 
            showPlugins = v249.showPlugins or not v50, 
            pluginOffsets = v249.pluginOffsets, 
            showGC = v249.showGC or not v49, 
            gcFunctionOffsets = v249.gcFunctionOffsets, 
            gcNodeOffsets = v249.gcNodeOffsets, 
            pluginGCOffsets = v249.pluginGCOffsets, 
            expandedNodes = if not l_isFunctionsView_1 then v249.expandedNodes else nil
        })
    });
end;
v44.render = function(v262)
    if not v262.props.isExporting then
        if not v262.props.isShowingMobileSettings then
            local l_formFactor_0 = v262.props.formFactor;
            local v264, v265 = v262:getActiveState();
            local v266 = {};
            local v267 = 1;
            local v268 = l_formFactor_0 == v37.FormFactor.Small;
            local v269 = (v51 and v268) and v262.state.showSimpleUI;
            if not (v268 and v48) then
                v266[1] = {
                    name = "Live", 
                    state = v265.liveUpdate
                };
                if v50 then
                    v267 = v267 + 1;
                    v266[v267] = {
                        name = "Plugins", 
                        state = v265.showPlugins
                    };
                end;
                if v49 then
                    v266[v267 + 1] = {
                        name = "GC", 
                        state = v265.showGC
                    };
                end;
            end;
            return v262:renderProfilerView(v264, v265, v262:renderUtilButtons(v265, v268, if not v48 then v269 else v268), v266);
        else
            return v262:renderMobileSettingsUI();
        end;
    else
        return v262:renderExportView();
    end;
end;
return v2.UNSTABLE_connect2(function(v270, _)
    return {
        isClientView = v270.ScriptProfiler.isClientView, 
        usePercentages = v270.ScriptProfiler.usePercentages, 
        isExporting = v270.ScriptProfiler.isExporting, 
        isShowingMobileSettings = v270.ScriptProfiler.isShowingMobileSettings, 
        client = v270.ScriptProfiler.client, 
        server = v270.ScriptProfiler.server
    };
end, function(v272)
    return {
        dispatchSetScriptProfilerState = function(v273, v274, v275, v276)
            v272(v24(v273, v274, v275, v276));
        end, 
        dispatchSetIsProfiling = function(v277, v278)
            v272(v25(v277, v278));
        end, 
        dispatchSetData = function(v279, v280)
            v272(v26(v279, v280));
        end, 
        dispatchSetThreads = function(v281, v282)
            v272(v27(v281, v282));
        end, 
        dispatchSetTimer = function(v283, v284)
            v272(v28(v283, v284));
        end, 
        dispatchClearStateForNewSession = function(v285)
            v272(v29(v285));
        end, 
        dispatchSetAverage = function(v286, v287)
            v272(v30(v286, v287));
        end, 
        dispatchSetFrequency = function(v288, v289)
            v272(v31(v288, v289));
        end, 
        dispatchSetDataView = function(v290, v291)
            v272(v32(v290, v291));
        end, 
        dispatchSetLiveUpdate = function(v292, v293)
            v272(v33(v292, v293));
        end, 
        dispatchSetShowPlugins = function(v294, v295)
            v272(v34(v294, v295));
        end, 
        dispatchSetShowGC = function(v296, v297)
            v272(v35(v296, v297));
        end, 
        dispatchSetSearchData = function(v298, v299)
            v272(v36(v298, v299));
        end, 
        dispatchStartExport = function()
            v272(v24(nil, nil, nil, nil, true));
        end, 
        dispatchFinishedExporting = function()
            v272(v24(nil, nil, nil, nil, false));
        end, 
        dispatchShowMobileSettings = function()
            v272(v24(nil, nil, nil, nil, nil, true));
        end, 
        dispatchHideMobileSettings = function()
            v272(v24(nil, nil, nil, nil, nil, false));
        end
    };
end)(v11(v44, "ServerProfilingData"));
