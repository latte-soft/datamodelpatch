local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_TimeUnit_0 = require(l_CorePackages_0.Workspace.Packages.Time).TimeUnit;
local l_DateTime_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateTime;
local v6 = {
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
            [l_TimeUnit_0.Months] = 1, 
            [l_TimeUnit_0.Days] = 2, 
            [l_TimeUnit_0.Years] = 3
        }, 
        ["es-es"] = {
            [l_TimeUnit_0.Days] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Years] = 3
        }, 
        ["fr-fr"] = {
            [l_TimeUnit_0.Days] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Years] = 3
        }, 
        ["de-de"] = {
            [l_TimeUnit_0.Days] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Years] = 3
        }, 
        ["pt-br"] = {
            [l_TimeUnit_0.Days] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Years] = 3
        }, 
        ["zh-cn"] = {
            [l_TimeUnit_0.Years] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Days] = 3
        }, 
        ["zh-cjv"] = {
            [l_TimeUnit_0.Years] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Days] = 3
        }, 
        ["zh-tw"] = {
            [l_TimeUnit_0.Years] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Days] = 3
        }, 
        ["ko-kr"] = {
            [l_TimeUnit_0.Years] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Days] = 3
        }, 
        ["ja-jp"] = {
            [l_TimeUnit_0.Years] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Days] = 3
        }, 
        ["it-it"] = {
            [l_TimeUnit_0.Days] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Years] = 3
        }, 
        ["ru-ru"] = {
            [l_TimeUnit_0.Days] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Years] = 3
        }, 
        ["id-id"] = {
            [l_TimeUnit_0.Days] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Years] = 3
        }, 
        ["vi-vn"] = {
            [l_TimeUnit_0.Days] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Years] = 3
        }, 
        ["th-th"] = {
            [l_TimeUnit_0.Days] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Years] = 3
        }, 
        ["tr-tr"] = {
            [l_TimeUnit_0.Days] = 1, 
            [l_TimeUnit_0.Months] = 2, 
            [l_TimeUnit_0.Years] = 3
        }
    }, {
        __index = function(v4, _)
            return v4["en-us"];
        end
    })
};
local v7 = {
    Prefix = "Prefix", 
    Suffix = "Suffix", 
    None = "None"
};
v6.DayAffixLocalizationKey = "CommonUI.Controls.Label.Day";
v6.DayAffixType = setmetatable({
    ["zh-cn"] = v7.Suffix, 
    ["zh-tw"] = v7.Suffix, 
    ["ko-kr"] = v7.Suffix, 
    ["ja-jp"] = v7.Suffix
}, {
    __index = function(_, _)
        return v7.None;
    end
});
v6.YearAffixLocalizationKey = "CommonUI.Controls.Label.Year";
v6.YearAffixType = setmetatable({
    ["zh-cn"] = v7.Suffix, 
    ["zh-tw"] = v7.Suffix, 
    ["ko-kr"] = v7.Suffix, 
    ["ja-jp"] = v7.Suffix, 
    ["th-th"] = v7.Prefix
}, {
    __index = function(_, _)
        return v7.None;
    end
});
v6.GetFormattedDayString = function(v12, v13, v14, v15)
    return v12:GetFormattedString(l_TimeUnit_0.Days, v13, v14, v15);
end;
v6.GetFormattedYearString = function(v16, v17, v18, v19)
    return v16:GetFormattedString(l_TimeUnit_0.Years, v17, v18, v19);
end;
v6.GetFormattedString = function(v20, v21, v22, v23, v24)
    v1.isNotNil(v21, "timeUnit passed into DateHelper:GetFormattedString");
    v1.isNotNil(v23, "affix passed into DateHelper:GetFormattedString");
    v22 = v1.isType(tostring(v22), "string", "dateValue passed into DateHelper:GetFormattedString");
    local v25 = nil;
    if v21 == l_TimeUnit_0.Days then
        v25 = v20.DayAffixType[v24];
    elseif v21 == l_TimeUnit_0.Years then
        v25 = v20.YearAffixType[v24];
    end;
    if v25 == v7.Prefix then
        return v23 .. v22;
    elseif v25 == v7.Suffix then
        return v22 .. v23;
    else
        return v22;
    end;
end;
v6.GetFormattedFullString = function(v26, v27, v28, v29, v30, v31, v32, v33)
    v27 = v1.isType(v27, "string", "localizedMonthString passed into DateHelper:GetFormattedFullString");
    v32 = v1.isType(v32, "string", "divider passed into DateHelper:GetFormattedFullString");
    v33 = v1.isType(v33, "string", "localeKey passed into DateHelper:GetFormattedFullString");
    local v34 = v26.DateTypeOrder[v33];
    local l_v26_FormattedDayString_0 = v26:GetFormattedDayString(v28, v29, v33);
    local l_v26_FormattedYearString_0 = v26:GetFormattedYearString(v30, v31, v33);
    local v37 = "";
    local v38 = {
        [v34[l_TimeUnit_0.Months]] = v27, 
        [v34[l_TimeUnit_0.Days]] = l_v26_FormattedDayString_0, 
        [v34[l_TimeUnit_0.Years]] = l_v26_FormattedYearString_0
    };
    for v39, v40 in ipairs(v38) do
        v37 = v37 .. v40;
        if v39 < #v38 then
            v37 = v37 .. v32;
        end;
    end;
    return v37;
end;
local function v42()
    local l_Values_0 = l_DateTime_0.now():GetValues();
    return {
        [l_TimeUnit_0.Months] = v1.isNonNegativeNumber(l_Values_0.Month, "current month in BirthdayPicker"), 
        [l_TimeUnit_0.Days] = v1.isNonNegativeNumber(l_Values_0.Day, "current day in BirthdayPicker"), 
        [l_TimeUnit_0.Years] = v1.isNonNegativeNumber(l_Values_0.Year, "current year in BirthdayPicker")
    };
end;
local function v45(v43)
    local l_Values_1 = l_DateTime_0.fromUnixTimestamp(l_DateTime_0.now():GetUnixTimestamp() + v43):GetValues();
    return {
        [l_TimeUnit_0.Months] = v1.isNonNegativeNumber(l_Values_1.Month, "current month in BirthdayPicker"), 
        [l_TimeUnit_0.Days] = v1.isNonNegativeNumber(l_Values_1.Day, "current day in BirthdayPicker"), 
        [l_TimeUnit_0.Years] = v1.isNonNegativeNumber(l_Values_1.Year, "current year in BirthdayPicker")
    };
end;
v6.isLeapYear = function(_, v47)
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
v6._isFutureDate = function(_, v51, v52, v53, v54)
    if v51[l_TimeUnit_0.Years] < v54 then
        return true;
    elseif v54 == v51[l_TimeUnit_0.Years] and v51[l_TimeUnit_0.Months] < v52 then
        return true;
    elseif (v54 == v51[l_TimeUnit_0.Years] and v52 == v51[l_TimeUnit_0.Months]) and v51[l_TimeUnit_0.Days] < v53 then
        return true;
    else
        return false;
    end;
end;
v6.isFutureDate = function(v55, v56, v57, v58)
    return v55:_isFutureDate(v42(), v56, v57, v58);
end;
v6.isRecentOrFutureDate = function(v59, v60, v61, v62)
    return v59:_isFutureDate(v45(-172800), v60, v61, v62);
end;
v6.getLastDayOfTheMonthInYear = function(v63, v64, v65)
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
v6.isInvalidDayOfTheMonth = function(v67, v68, v69, v70)
    return v67:getLastDayOfTheMonthInYear(v68, v70) < v69;
end;
v6.isValidDate = function(v71, v72, v73, v74)
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
return v6;
