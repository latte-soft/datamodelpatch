local v0 = require(script:FindFirstAncestor("Time").Parent.ArgCheck);
local v1 = require(script.Parent.TimeUnit);
local v2 = require(script.Parent.DateTime);
local v5 = {
    ReasonDateInvalid = {
        IsFutureDate = "IsFutureDate", 
        IsInvalidDayOfMonth = "IsInvalidDayOfMonth"
    }, 
    MonthsLocalizationKeys = {
        "CommonUI.Controls.Label.January", 
        "CommonUI.Controls.Label.February", 
        "CommonUI.Controls.Label.March", 
        "CommonUI.Controls.Label.April", 
        "CommonUI.Controls.Label.May", 
        "CommonUI.Controls.Label.June", 
        "CommonUI.Controls.Label.July", 
        "CommonUI.Controls.Label.August", 
        "CommonUI.Controls.Label.September", 
        "CommonUI.Controls.Label.October", 
        "CommonUI.Controls.Label.November", 
        "CommonUI.Controls.Label.December"
    }, 
    DateTypeOrder = setmetatable({
        ["en-us"] = {
            [v1.Months] = 1, 
            [v1.Days] = 2, 
            [v1.Years] = 3
        }, 
        ["es-es"] = {
            [v1.Days] = 1, 
            [v1.Months] = 2, 
            [v1.Years] = 3
        }, 
        ["fr-fr"] = {
            [v1.Days] = 1, 
            [v1.Months] = 2, 
            [v1.Years] = 3
        }, 
        ["de-de"] = {
            [v1.Days] = 1, 
            [v1.Months] = 2, 
            [v1.Years] = 3
        }, 
        ["pt-br"] = {
            [v1.Days] = 1, 
            [v1.Months] = 2, 
            [v1.Years] = 3
        }, 
        ["zh-cn"] = {
            [v1.Years] = 1, 
            [v1.Months] = 2, 
            [v1.Days] = 3
        }, 
        ["zh-cjv"] = {
            [v1.Years] = 1, 
            [v1.Months] = 2, 
            [v1.Days] = 3
        }, 
        ["zh-tw"] = {
            [v1.Years] = 1, 
            [v1.Months] = 2, 
            [v1.Days] = 3
        }, 
        ["ko-kr"] = {
            [v1.Years] = 1, 
            [v1.Months] = 2, 
            [v1.Days] = 3
        }, 
        ["ja-jp"] = {
            [v1.Years] = 1, 
            [v1.Months] = 2, 
            [v1.Days] = 3
        }, 
        ["it-it"] = {
            [v1.Days] = 1, 
            [v1.Months] = 2, 
            [v1.Years] = 3
        }, 
        ["ru-ru"] = {
            [v1.Days] = 1, 
            [v1.Months] = 2, 
            [v1.Years] = 3
        }, 
        ["id-id"] = {
            [v1.Days] = 1, 
            [v1.Months] = 2, 
            [v1.Years] = 3
        }, 
        ["vi-vn"] = {
            [v1.Days] = 1, 
            [v1.Months] = 2, 
            [v1.Years] = 3
        }, 
        ["th-th"] = {
            [v1.Days] = 1, 
            [v1.Months] = 2, 
            [v1.Years] = 3
        }, 
        ["tr-tr"] = {
            [v1.Days] = 1, 
            [v1.Months] = 2, 
            [v1.Years] = 3
        }
    }, {
        __index = function(_, _)
            return {
                [v1.Years] = 1, 
                [v1.Months] = 2, 
                [v1.Days] = 3
            };
        end
    })
};
local v6 = {
    Prefix = "Prefix", 
    Suffix = "Suffix", 
    None = "None"
};
v5.DayAffixLocalizationKey = "CommonUI.Controls.Label.Day";
v5.DayAffixType = setmetatable({
    ["zh-cn"] = v6.Suffix, 
    ["zh-tw"] = v6.Suffix, 
    ["ko-kr"] = v6.Suffix, 
    ["ja-jp"] = v6.Suffix
}, {
    __index = function(_, _)
        return v6.None;
    end
});
v5.YearAffixLocalizationKey = "CommonUI.Controls.Label.Year";
v5.YearAffixType = setmetatable({
    ["zh-cn"] = v6.Suffix, 
    ["zh-tw"] = v6.Suffix, 
    ["ko-kr"] = v6.Suffix, 
    ["ja-jp"] = v6.Suffix
}, {
    __index = function(_, _)
        return v6.None;
    end
});
v5.GetFormattedDayString = function(v11, v12, v13, v14)
    return v11:GetFormattedString(v1.Days, v12, v13, v14);
end;
v5.GetFormattedYearString = function(v15, v16, v17, v18)
    return v15:GetFormattedString(v1.Years, v16, v17, v18);
end;
v5.GetFormattedString = function(v19, v20, v21, v22, v23)
    v0.isNotNil(v20, "timeUnit passed into DateHelper:GetFormattedString");
    v0.isNotNil(v22, "affix passed into DateHelper:GetFormattedString");
    v21 = v0.isType(tostring(v21), "string", "dateValue passed into DateHelper:GetFormattedString");
    local v24 = nil;
    if v20 == v1.Days then
        v24 = v19.DayAffixType[v23];
    elseif v20 == v1.Years then
        v24 = v19.YearAffixType[v23];
    end;
    if v24 == v6.Prefix then
        return v22 .. v21;
    elseif v24 == v6.Suffix then
        return v21 .. v22;
    else
        return v21;
    end;
end;
v5.GetFormattedFullString = function(v25, v26, v27, v28, v29, v30, v31, v32)
    v26 = v0.isType(v26, "string", "localizedMonthString passed into DateHelper:GetFormattedFullString");
    v31 = v0.isType(v31, "string", "divider passed into DateHelper:GetFormattedFullString");
    v32 = v0.isType(v32, "string", "localeKey passed into DateHelper:GetFormattedFullString");
    local v33 = v25.DateTypeOrder[v32];
    local l_v25_FormattedDayString_0 = v25:GetFormattedDayString(v27, v28, v32);
    local l_v25_FormattedYearString_0 = v25:GetFormattedYearString(v29, v30, v32);
    local v36 = "";
    local v37 = {
        [v33[v1.Months]] = v26, 
        [v33[v1.Days]] = l_v25_FormattedDayString_0, 
        [v33[v1.Years]] = l_v25_FormattedYearString_0
    };
    for v38, v39 in ipairs(v37) do
        v36 = v36 .. v39;
        if v38 < #v37 then
            v36 = v36 .. v31;
        end;
    end;
    return v36;
end;
local function v41()
    local l_Values_0 = v2.now():GetValues();
    return {
        [v1.Months] = v0.isNonNegativeNumber(l_Values_0.Month, "current month in BirthdayPicker"), 
        [v1.Days] = v0.isNonNegativeNumber(l_Values_0.Day, "current day in BirthdayPicker"), 
        [v1.Years] = v0.isNonNegativeNumber(l_Values_0.Year, "current year in BirthdayPicker")
    };
end;
v5.getCurrentDate = function(_)
    return (v41());
end;
local function v45(v43)
    local l_Values_1 = v2.fromUnixTimestamp(v2.now():GetUnixTimestamp() + v43):GetValues();
    return {
        [v1.Months] = v0.isNonNegativeNumber(l_Values_1.Month, "current month in BirthdayPicker"), 
        [v1.Days] = v0.isNonNegativeNumber(l_Values_1.Day, "current day in BirthdayPicker"), 
        [v1.Years] = v0.isNonNegativeNumber(l_Values_1.Year, "current year in BirthdayPicker")
    };
end;
v5.isLeapYear = function(_, v47)
    local v48 = false;
    if v47 % 4 == 0 then
        v48 = true;
        if v47 % 100 == 0 then
            v48 = v47 % 400 == 0;
        end;
    end;
    return v48;
end;
local v49 = {};
v5._isFutureDate = function(_, v51, v52, v53, v54)
    if v51[v1.Years] < v54 then
        return true;
    elseif v54 == v51[v1.Years] and v51[v1.Months] < v52 then
        return true;
    elseif (v54 == v51[v1.Years] and v52 == v51[v1.Months]) and v51[v1.Days] < v53 then
        return true;
    else
        return false;
    end;
end;
v5.isFutureDate = function(v55, v56, v57, v58)
    return v55:_isFutureDate(v41(), v56, v57, v58);
end;
v5.isRecentOrFutureDate = function(v59, v60, v61, v62)
    return v59:_isFutureDate(v45(-172800), v60, v61, v62);
end;
v5.getLastDayOfTheMonthInYear = function(v63, v64, v65)
    if not v49[v64] or not v49[v64][v65] then
        local v66 = nil;
        v66 = if v64 == 2 then not v63:isLeapYear(v65) and 28 or 29 else (not (not (v64 % 2 == 0) or v64 >= 7) or v64 % 2 == 1 and v64 > 7) and 30 or 31;
        if not v49[v64] then
            v49[v64] = {};
        end;
        v49[v64][v65] = v66;
        return v66;
    else
        return v49[v64][v65];
    end;
end;
v5.isInvalidDayOfTheMonth = function(v67, v68, v69, v70)
    return v67:getLastDayOfTheMonthInYear(v68, v70) < v69;
end;
v5.isValidDate = function(v71, v72, v73, v74)
    if not v71:isRecentOrFutureDate(v72, v73, v74) then
        if not v71:isInvalidDayOfTheMonth(v72, v73, v74) then
            return true, nil;
        else
            return false, v71.ReasonDateInvalid.IsInvalidDayOfMonth;
        end;
    else
        return false, v71.ReasonDateInvalid.IsFutureDate;
    end;
end;
return v5;
