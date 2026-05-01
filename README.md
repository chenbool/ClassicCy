# ClassicCy - 魔兽世界战斗提示插件

为魔兽世界添加的战斗状态提示插件，支持 PVP 和 PVE 玩法。

## 特性

- 进出战斗时醒目提示
- 打断敌对施法条时在小队或团队进行喊话
- 监控打断者、打断对象、打断的法术
- 支持 SHADOWLANDS 和 WOW CLASSIC
- 不干扰当前热键设置或配置

## 支持平台

- 国服
- 台服
- 港服

## 项目结构

```
ClassicCy/
├── core.lua               # 核心逻辑
├── SlashCMD.lua          # 命令行处理
├── CombatHint.lua        # 战斗提示
├── InterruptHint.lua      # 打断提示
├── ClassicCy.toc        # 插件清单
├── CHANGE_LOG.txt        # 更新日志
├── LICENSE               # 许可证
└── README.md
```

## 使用帮助

### 命令

| 命令 | 说明 |
|------|------|
| `/ccy` | 查看命令列表 |
| `/ccy help` | 查看帮助 |

### 功能说明

- **战斗提示**：进出战斗时提供醒目提示
- **打断提示**：在打断敌对施法时自动在小队/团队喊话

## 版本历史

| 版本 | 更新内容 |
|------|----------|
| v3.0.5 | 当前版本 |
| v3.0.4 | 随游戏更新版本号 |
| v3.0.3 | 打断提示开关可以正常关闭 |
| v3.0.2 | 完善提示逻辑细节，删除无关代码 |
| v3.0.1 | 修正 global function 缺失 |
| v3.0.0 | 增加命令行 /ccy 查看帮助 |
| v2.0.0 | 增加打断者、打断对象、打断法术 |
| v1.0.0 | 插件首次发布 |

## 相关链接

- [GitHub 源码](https://github.com/chenbool/ClassicCy)
- [NGA 论坛](https://nga.178.com)

## 联系方式

- QQ群：484043598
- 作者：chenbool

## 许可证

MIT License
