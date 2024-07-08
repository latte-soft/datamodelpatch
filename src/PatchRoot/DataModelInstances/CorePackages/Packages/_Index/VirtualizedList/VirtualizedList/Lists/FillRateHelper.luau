local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_console_0 = v0.console;
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
local v4 = {};
v4.__index = v4;
v4.new = function()
    local v5 = setmetatable({}, v4);
    v5.any_blank_count = 0;
    v5.any_blank_ms = 0;
    v5.any_blank_speed_sum = 0;
    v5.mostly_blank_count = 0;
    v5.mostly_blank_ms = 0;
    v5.pixels_blank = 0;
    v5.pixels_sampled = 0;
    v5.pixels_scrolled = 0;
    v5.total_time_spent = 0;
    v5.sample_count = 0;
    return v5;
end;
local v6 = {};
local v7 = 10;
local v8 = nil;
local v9 = {};
v9.__index = v9;
v9.new = function(v10)
    local v11 = setmetatable({}, v9);
    v11._anyBlankStartTime = nil;
    v11._enabled = false;
    v11._info = v4.new();
    v11._mostlyBlankStartTime = nil;
    v11._samplesStartTime = nil;
    v11._getFrameMetrics = v10;
    if not v8 then
        v11._enabled = math.random() < 0;
    else
        v11._enabled = math.random() < v8;
    end;
    v11:_resetData();
    return v11;
end;
v9.addListener = function(v12)
    if v8 == nil then
        l_console_0.warn("Call `FillRateHelper.setSampleRate` before `addListener`.");
    end;
    table.insert(v6, v12);
    return {
        remove = function()
            v6 = l_Array_0.filter(v6, function(v13)
                return v12 ~= v13;
            end);
        end
    };
end;
v9.setSampleRate = function(v14)
    v8 = v14;
end;
v9.setMinSampleCount = function(v15)
    v7 = v15;
end;
v9.activate = function(v16)
    if v16._enabled and v16._samplesStartTime == nil then
        v16._samplesStartTime = os.clock();
    end;
end;
v9.deactivateAndFlush = function(v17)
    if v17._enabled then
        local l__samplesStartTime_0 = v17._samplesStartTime;
        if l__samplesStartTime_0 == nil then
            return ;
        elseif v17._info.sample_count < v7 then
            v17:_resetData();
            return ;
        else
            local v19 = l_Object_0.assign({}, v17._info, {
                total_time_spent = os.clock() - l__samplesStartTime_0
            });
            l_Array_0.forEach(v6, function(v20)
                return v20(v19);
            end);
            v17:_resetData();
            return ;
        end;
    else
        return ;
    end;
end;
v9.computeBlankness = function(v21, v22, v23, v24)
    if not (v21._enabled and v22.getItemCount(v22.data) ~= 0) or v21._samplesStartTime == nil then
        return 0;
    else
        local l_dOffset_0 = v24.dOffset;
        local l_offset_0 = v24.offset;
        local l_velocity_0 = v24.velocity;
        local l_visibleLength_0 = v24.visibleLength;
        local l__info_0 = v21._info;
        l__info_0.sample_count = l__info_0.sample_count + 1;
        l__info_0 = v21._info;
        l__info_0.pixels_sampled = l__info_0.pixels_sampled + math.round(l_visibleLength_0);
        l__info_0 = v21._info;
        l__info_0.pixels_scrolled = l__info_0.pixels_scrolled + math.round((math.abs(l_dOffset_0 or 0)));
        l__info_0 = math.round(math.abs(l_velocity_0 or 0) * 1000);
        local v30 = os.clock() * 1000;
        if v21._anyBlankStartTime ~= nil then
            local l__info_1 = v21._info;
            l__info_1.any_blank_ms = l__info_1.any_blank_ms + (v30 - v21._anyBlankStartTime);
        end;
        v21._anyBlankStartTime = nil;
        if v21._mostlyBlankStartTime ~= nil then
            local l__info_2 = v21._info;
            l__info_2.mostly_blank_ms = l__info_2.mostly_blank_ms + (v30 - v21._mostlyBlankStartTime);
        end;
        v21._mostlyBlankStartTime = nil;
        local v33 = 0;
        local l_first_0 = v23.first;
        local v35 = v21._getFrameMetrics(l_first_0);
        while not (not (l_first_0 <= v23.last) or v35 and v35.inLayout) do
            v35 = v21._getFrameMetrics(l_first_0);
            l_first_0 = l_first_0 + 1;
        end;
        if v35 and l_first_0 > 1 then
            v33 = math.min(l_visibleLength_0, (math.max(0, v35.offset - l_offset_0)));
        end;
        local v36 = 0;
        local l_last_0 = v23.last;
        local v38 = v21._getFrameMetrics(l_last_0);
        while not (not (v23.first <= l_last_0) or v38 and v38.inLayout) do
            v38 = v21._getFrameMetrics(l_last_0);
            l_last_0 = l_last_0 - 1;
        end;
        if v38 and l_last_0 < v22.getItemCount(v22.data) then
            v36 = math.min(l_visibleLength_0, (math.max(0, (l_offset_0 + l_visibleLength_0) - (v38.offset + v38.length))));
        end;
        local v39 = math.round(v33 + v36);
        local v40 = v39 / l_visibleLength_0;
        if v40 > 0 then
            v21._anyBlankStartTime = v30;
            local l__info_3 = v21._info;
            l__info_3.any_blank_speed_sum = l__info_3.any_blank_speed_sum + l__info_0;
            l__info_3 = v21._info;
            l__info_3.any_blank_count = l__info_3.any_blank_count + 1;
            l__info_3 = v21._info;
            l__info_3.pixels_blank = l__info_3.pixels_blank + v39;
            if v40 > 0.5 then
                v21._mostlyBlankStartTime = v30;
                l__info_3 = v21._info;
                l__info_3.mostly_blank_count = l__info_3.mostly_blank_count + 1;
                return v40;
            end;
        elseif not (l__info_0 >= 0.01) or math.abs(l_dOffset_0 or 0) < 1 then
            v21:deactivateAndFlush();
        end;
        return v40;
    end;
end;
v9.enabled = function(v42)
    return v42._enabled;
end;
v9._resetData = function(v43)
    v43._anyBlankStartTime = nil;
    v43._info = v4.new();
    v43._mostlyBlankStartTime = nil;
    v43._samplesStartTime = nil;
end;
return v9;
