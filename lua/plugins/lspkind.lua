local ok, lspkind = pcall(require, 'lspkind')
if not ok then return end

-- source https://github.com/mortepau/codicons.nvim file table.lua
SYMBOL_MAP = {
    Array = '',
    Boolean = '',
    Class = '',
    Constant = '',
    Constructor = '',
    Enum = '',
    EnumMember = '',
    Event = '',
    Field = '',
    File = '',
    Function = '',
    Interface = '',
    Key = '',
    Method = '',
    Module = '',
    Namespace = '',
    Null = '',
    Number = '',
    Object = '',
    Operator = '',
    Package = '',
    Property = '',
    String = '',
    Struct = '',
    TypeParameter = '',
    Variable = '',
}

lspkind.init {
    symbol_map = SYMBOL_MAP,
}
