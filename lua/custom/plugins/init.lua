-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',
    lazy = false,
    opts = {},
    config = function()
      require('Comment.ft').set('daml', {'--%s', '{-%s-}'})
    end
  },
}
