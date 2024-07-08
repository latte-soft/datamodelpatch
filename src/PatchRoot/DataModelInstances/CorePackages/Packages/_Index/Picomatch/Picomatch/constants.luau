local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(l_Parent_0.RegExp);
local v3 = ("[^%s]"):format("\\\\/");
local v4 = ("(?:%s|$)"):format("\\/");
local v5 = ("(?:^|%s)"):format("\\/");
local v6 = ("%s{1,2}%s"):format("\\.", v4);
local v7 = {
    DOT_LITERAL = "\\.", 
    PLUS_LITERAL = "\\+", 
    QMARK_LITERAL = "\\?", 
    SLASH_LITERAL = "\\/", 
    ONE_CHAR = "(?=.)", 
    QMARK = "[^/]", 
    END_ANCHOR = v4, 
    DOTS_SLASH = v6, 
    NO_DOT = ("(?format("\\."), 
    NO_DOTS = ("(?format(v5, v6), 
    NO_DOT_SLASH = ("(?format("\\.", v4), 
    NO_DOTS_SLASH = ("(?format(v6), 
    QMARK_NO_DOT = ("[^.%s]"):format("\\/"), 
    STAR = ("%s*?"):format("[^/]"), 
    START_ANCHOR = v5
};
local v8 = l_Object_0.assign({}, v7, {
    SLASH_LITERAL = ("[%s]"):format("\\\\/"), 
    QMARK = v3, 
    STAR = ("%s*?"):format(v3), 
    DOTS_SLASH = ("%s{1,2}(?:[%s]|$)"):format("\\.", "\\\\/"), 
    NO_DOT = ("(?format("\\."), 
    NO_DOTS = ("(?|[%s])%s{1,2}(?:[%s]|$))"):format("\\\\/", "\\.", "\\\\/"), 
    NO_DOT_SLASH = ("(?[%s]|$))"):format("\\.", "\\\\/"), 
    NO_DOTS_SLASH = ("(?[%s]|$))"):format("\\.", "\\\\/"), 
    QMARK_NO_DOT = ("[^.%s]"):format("\\\\/"), 
    START_ANCHOR = ("(?:^|[%s])"):format("\\\\/"), 
    END_ANCHOR = ("(?:[%s]|$)"):format("\\\\/")
});
return {
    MAX_LENGTH = 65536, 
    POSIX_REGEX_SOURCE = {
        alnum = "a-zA-Z0-9", 
        alpha = "a-zA-Z", 
        ascii = "\\x00-\\x7F", 
        blank = " \\t", 
        cntrl = "\\x00-\\x1F\\x7F", 
        digit = "0-9", 
        graph = "\\x21-\\x7E", 
        lower = "a-z", 
        print = "\\x20-\\x7E ", 
        punct = "\\-;<=>?@[\\]_`{|}~", 
        space = " \\t\\r\\n\\v\\f", 
        upper = "A-Z", 
        word = "A-Za-z0-9_", 
        xdigit = "A-Fa-f0-9"
    }, 
    REGEX_NON_SPECIAL_CHARS = "[@[%].,$*+?{}()|\\/]+", 
    REGEX_SPECIAL_CHARS = "[-*+?.^${}(|)[%]]", 
    REGEX_SPECIAL_CHARS_BACKREF = v2("(\\\\?)((\\W)(\\3*))"), 
    REGEX_SPECIAL_CHARS_GLOBAL = v2("([-*+?.^${}(|)[\\]])"), 
    REPLACEMENTS = {
        ["***"] = "*", 
        ["**/**"] = "**", 
        ["**/**/**"] = "**"
    }, 
    CHAR_0 = 48, 
    CHAR_9 = 57, 
    CHAR_UPPERCASE_A = 65, 
    CHAR_LOWERCASE_A = 97, 
    CHAR_UPPERCASE_Z = 90, 
    CHAR_LOWERCASE_Z = 122, 
    CHAR_LEFT_PARENTHESES = 40, 
    CHAR_RIGHT_PARENTHESES = 41, 
    CHAR_ASTERISK = 42, 
    CHAR_AMPERSAND = 38, 
    CHAR_AT = 64, 
    CHAR_BACKWARD_SLASH = 92, 
    CHAR_CARRIAGE_RETURN = 13, 
    CHAR_CIRCUMFLEX_ACCENT = 94, 
    CHAR_COLON = 58, 
    CHAR_COMMA = 44, 
    CHAR_DOT = 46, 
    CHAR_DOUBLE_QUOTE = 34, 
    CHAR_EQUAL = 61, 
    CHAR_EXCLAMATION_MARK = 33, 
    CHAR_FORM_FEED = 12, 
    CHAR_FORWARD_SLASH = 47, 
    CHAR_GRAVE_ACCENT = 96, 
    CHAR_HASH = 35, 
    CHAR_HYPHEN_MINUS = 45, 
    CHAR_LEFT_ANGLE_BRACKET = 60, 
    CHAR_LEFT_CURLY_BRACE = 123, 
    CHAR_LEFT_SQUARE_BRACKET = 91, 
    CHAR_LINE_FEED = 10, 
    CHAR_NO_BREAK_SPACE = 160, 
    CHAR_PERCENT = 37, 
    CHAR_PLUS = 43, 
    CHAR_QUESTION_MARK = 63, 
    CHAR_RIGHT_ANGLE_BRACKET = 62, 
    CHAR_RIGHT_CURLY_BRACE = 125, 
    CHAR_RIGHT_SQUARE_BRACKET = 93, 
    CHAR_SEMICOLON = 59, 
    CHAR_SINGLE_QUOTE = 39, 
    CHAR_SPACE = 32, 
    CHAR_TAB = 9, 
    CHAR_UNDERSCORE = 95, 
    CHAR_VERTICAL_LINE = 124, 
    CHAR_ZERO_WIDTH_NOBREAK_SPACE = 65279, 
    SEP = "/", 
    extglobChars = function(v9)
        return {
            [""] = {
                type = "negate", 
                open = "(?:(?", 
                close = ("))%s)"):format(v9.STAR)
            }, 
            ["?"] = {
                type = "qmark", 
                open = "(?:", 
                close = ")?"
            }, 
            ["+"] = {
                type = "plus", 
                open = "(?:", 
                close = ")+"
            }, 
            ["*"] = {
                type = "star", 
                open = "(?:", 
                close = ")*"
            }, 
            ["@"] = {
                type = "at", 
                open = "(?:", 
                close = ")"
            }
        };
    end, 
    globChars = function(v10)
        if v10 == true then
            return v8;
        else
            return v7;
        end;
    end
};
