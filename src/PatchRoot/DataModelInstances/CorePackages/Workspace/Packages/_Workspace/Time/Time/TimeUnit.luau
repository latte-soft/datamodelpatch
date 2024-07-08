local v2 = setmetatable({}, {
    __index = function(_, v1)
        error(("Invalid TimeUnit \"%s\""):format((tostring(v1))), 2);
    end
});
v2.Seconds = "Seconds";
v2.Minutes = "Minutes";
v2.Hours = "Hours";
v2.Days = "Days";
v2.Months = "Months";
v2.Years = "Years";
v2.Weeks = "Weeks";
return v2;
