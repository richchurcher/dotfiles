-- function! PathCondense()
--     if expand(':h') == '/'
--         return '/' . expand('%:t')
--     else
--         return pathshorten(expand('%:h')) . '/' . expand('%:t')
--     endif
-- endfunction
function _G.pathcondense()
  if vim.fn.expand(":h") == "/" then
    return "/" .. vim.fn.expand("%:t")
  else
    return vim.fn.pathshorten(vim.fn.expand("%:h")) .. "/" .. vim.fn.expand("%:t")
  end
end
