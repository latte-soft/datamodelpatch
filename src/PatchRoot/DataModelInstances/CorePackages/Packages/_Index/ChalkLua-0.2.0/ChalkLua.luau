local function v7(v0, v1, v2)
    local v3 = string.find(v0, v1, 1, true);
    if v3 == nil then
        return v0;
    else
        local v4 = #v1;
        local v5 = 1;
        local v6 = "";
        while true do
            v6 = v6 .. string.sub(v0, v5, v3 - 1) .. v1 .. v2;
            v5 = v3 + v4;
            v3 = string.find(v0, v1, v5, true);
            if not (v3 ~= nil) then
                break;
            end;
        end;
        return v6 .. string.sub(v0, v5);
    end;
end;
local function v15(v8, v9, v10, v11)
    local v12 = 1;
    local v13 = "";
    while true do
        local v14 = string.sub(v8, v11 - 1, v11 - 1) == "\r";
        v13 = v13 .. string.sub(v8, v12, if not v14 then v11 - 1 else v11 - 2) .. v9 .. (not v14 and "\n" or "\r\n") .. v10;
        v12 = v11 + 1;
        v11 = string.find(v8, "\n", v12);
        if not (v11 ~= nil) then
            break;
        end;
    end;
    return v13 .. string.sub(v8, v12);
end;
local v16 = {
    modifier = {
        reset = {
            0, 
            0
        }, 
        bold = {
            1, 
            22
        }, 
        dim = {
            2, 
            22
        }, 
        italic = {
            3, 
            23
        }, 
        underline = {
            4, 
            24
        }, 
        overline = {
            53, 
            55
        }, 
        inverse = {
            7, 
            27
        }, 
        hidden = {
            8, 
            28
        }, 
        strikethrough = {
            9, 
            29
        }
    }, 
    color = {
        black = {
            30, 
            39
        }, 
        red = {
            31, 
            39
        }, 
        green = {
            32, 
            39
        }, 
        yellow = {
            33, 
            39
        }, 
        blue = {
            34, 
            39
        }, 
        magenta = {
            35, 
            39
        }, 
        cyan = {
            36, 
            39
        }, 
        white = {
            37, 
            39
        }, 
        blackBright = {
            90, 
            39
        }, 
        gray = {
            90, 
            39
        }, 
        grey = {
            90, 
            39
        }, 
        redBright = {
            91, 
            39
        }, 
        greenBright = {
            92, 
            39
        }, 
        yellowBright = {
            93, 
            39
        }, 
        blueBright = {
            94, 
            39
        }, 
        magentaBright = {
            95, 
            39
        }, 
        cyanBright = {
            96, 
            39
        }, 
        whiteBright = {
            97, 
            39
        }
    }, 
    bgColor = {
        bgBlack = {
            40, 
            49
        }, 
        bgRed = {
            41, 
            49
        }, 
        bgGreen = {
            42, 
            49
        }, 
        bgYellow = {
            43, 
            49
        }, 
        bgBlue = {
            44, 
            49
        }, 
        bgMagenta = {
            45, 
            49
        }, 
        bgCyan = {
            46, 
            49
        }, 
        bgWhite = {
            47, 
            49
        }, 
        bgBlackBright = {
            100, 
            49
        }, 
        bgGray = {
            100, 
            49
        }, 
        bgGrey = {
            100, 
            49
        }, 
        bgRedBright = {
            101, 
            49
        }, 
        bgGreenBright = {
            102, 
            49
        }, 
        bgYellowBright = {
            103, 
            49
        }, 
        bgBlueBright = {
            104, 
            49
        }, 
        bgMagentaBright = {
            105, 
            49
        }, 
        bgCyanBright = {
            106, 
            49
        }, 
        bgWhiteBright = {
            107, 
            49
        }
    }
};
local v17 = {};
for _, v19 in pairs(v16) do
    for v20, v21 in pairs(v19) do
        v17[v20] = {
            open = string.format("%c[%dm", 27, v21[1]), 
            close = string.format("%c[%dm", 27, v21[2])
        };
    end;
end;
local v22 = nil;
local v23 = nil;
local function v26(v24, v25)
    return v22(v24.open .. v25.open, v25.close .. v24.close);
end;
local function _()
    return (pcall(function()
        game:GetService("ProcessService");
    end));
end;
local v28 = {
    level = 2
};
if not (not _G.NOCOLOR and pcall(function()
    game:GetService("ProcessService");
end)) then
    v28.level = 0;
end;
setmetatable(v28, {
    __call = function(_, v30)
        if not (v30 ~= nil) or type(v30) == "string" and #v30 == 0 then
            return "";
        else
            return (tostring(v30));
        end;
    end
});
v22 = function(v31, v32)
    local v33 = {
        open = v31, 
        close = v32
    };
    setmetatable(v33, {
        __call = function(v34, v35)
            return v23(v34, v35);
        end, 
        __concat = function(v36, v37)
            return v26(v36, v37);
        end
    });
    return v33;
end;
v23 = function(v38, v39)
    if not (v39 ~= nil) or type(v39) == "string" and #v39 == 0 then
        return "";
    elseif v28.level == 0 then
        return (tostring(v39));
    else
        local l_open_0 = v38.open;
        local l_close_0 = v38.close;
        if string.match(v39, "\027") then
            v39 = v7(v39, v38.close, v38.open);
        end;
        local v42 = string.find(v39, "\n");
        if v42 ~= nil then
            v39 = v15(v39, l_close_0, l_open_0, v42);
        end;
        return v38.open .. tostring(v39) .. v38.close;
    end;
end;
local function v43()
    return v22("", "");
end;
local v44 = string.format("%c[%dm", 27, 39);
local v45 = string.format("%c[%dm", 27, 49);
local v46 = string.format("%c[%dm", 27, 0);
for v47, v48 in pairs(v17) do
    v28[v47] = v22(v48.open, v48.close);
end;
v28.reset = v22(v46, v46);
local function v52(v49, v50, v51)
    if v49 == v50 and v50 == v51 then
        if v49 < 8 then
            return 16;
        elseif v49 > 248 then
            return 231;
        else
            return (math.round(((v49 - 8) / 247) * 24 + 232));
        end;
    else
        return ((16 + 36 * math.round((v49 / 255) * 5)) + 6 * math.round((v50 / 255) * 5)) + math.round((v51 / 255) * 5);
    end;
end;
v28.rgb = function(v53, v54, v55)
    if not (((((((type(v53) == "number" and type(v54) == "number") and type(v55) == "number") and v53 <= 255) and v53 >= 0) and v54 <= 255) and v54 >= 0) and v55 <= 255) or v55 < 0 then
        return v43();
    else
        return v22(string.format("%c[%d;5;%dm", 27, 38, (v52(v53, v54, v55))), v44);
    end;
end;
v28.bgRgb = function(v56, v57, v58)
    if not (((((((type(v56) == "number" and type(v57) == "number") and type(v58) == "number") and v56 <= 255) and v56 >= 0) and v57 <= 255) and v57 >= 0) and v58 <= 255) or v58 < 0 then
        return v43();
    else
        return v22(string.format("%c[%d;5;%dm", 27, 48, (v52(v56, v57, v58))), v45);
    end;
end;
local function _(v59)
    return (v52(tonumber(string.sub(v59, 2, 3), 16), tonumber(string.sub(v59, 4, 5), 16), (tonumber(string.sub(v59, 6, 7), 16))));
end;
v28.hex = function(v61)
    if not (type(v61) == "string" and string.find(v61, "#%X") == nil) or #v61 ~= 7 then
        return v43();
    else
        return v22(string.format("%c[%d;5;%dm", 27, 38, (v52(tonumber(string.sub(v61, 2, 3), 16), tonumber(string.sub(v61, 4, 5), 16), (tonumber(string.sub(v61, 6, 7), 16))))), v44);
    end;
end;
v28.bgHex = function(v62)
    if not (type(v62) == "string" and string.find(v62, "#%X") == nil) or #v62 ~= 7 then
        return v43();
    else
        return v22(string.format("%c[%d;5;%dm", 27, 48, (v52(tonumber(string.sub(v62, 2, 3), 16), tonumber(string.sub(v62, 4, 5), 16), (tonumber(string.sub(v62, 6, 7), 16))))), v45);
    end;
end;
v28.ansi = function(v63)
    if not ((type(v63) == "number" and v63 >= 30) and (not (v63 > 37) or v63 >= 90)) or v63 > 97 then
        return v43();
    else
        return v22(string.format("%c[%dm", 27, v63), v44);
    end;
end;
v28.bgAnsi = function(v64)
    if not ((type(v64) == "number" and v64 >= 40) and (not (v64 > 47) or v64 >= 100)) or v64 > 107 then
        return v43();
    else
        return v22(string.format("%c[%dm", 27, v64), v45);
    end;
end;
v28.ansi256 = function(v65)
    if not (type(v65) == "number" and v65 >= 0) or v65 > 255 then
        return v43();
    else
        return v22(string.format("%c[%d;5;%dm", 27, 38, v65), v44);
    end;
end;
v28.bgAnsi256 = function(v66)
    if not (type(v66) == "number" and v66 >= 0) or v66 > 255 then
        return v43();
    else
        return v22(string.format("%c[%d;5;%dm", 27, 48, v66), v45);
    end;
end;
return v28;
