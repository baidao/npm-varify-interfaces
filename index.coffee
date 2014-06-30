'use strict'

path = require 'path'
init = require './lib/init'
markdown = require './lib/markdown'
server = require './lib/server'

# 默认配置
DEFAULTS =
  configFile: './schema/config.json'

module.exports =
  exec: (argv) ->
    # 初始化
    if argv.i or argv.init
      try
        init.init()
      catch err
        console.error err, 'init failed..'

    # 文档生成
    else if argv.d or argv.doc
      try
        configPath = path.resolve process.cwd(), DEFAULTS.configFile
        config = require configPath
        markdown.create config
      catch err
        console.error err, 'create api doc failed..'

    # mock服务器
    else if argv.m or argv.mock
      try
        configPath = path.resolve process.cwd(), DEFAULTS.configFile
        config = require configPath
        server.create config
      catch err
        console.error err, 'create mock server failed..'
