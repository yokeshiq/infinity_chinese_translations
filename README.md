# Infinity ROM (Android 17) 简体中文汉化补丁包

本项目为 **Infinity ROM (Android 17)** 官方源码树的简体中文（`values-zh-rCN`）本地化补丁包。解决上游更新中大量自定义设置项、高级键盘、手势沙盒、多任务功能缺少中文翻译或直接显示英文占位符的问题。

---

## 📌 汉化覆盖组件

- **系统设置 (`packages/apps/Settings`)**
  - Infinity 自定义特色设置（`infinity_strings.xml`）
  - LineageOS / CM 核心高级选项（`cm_strings.xml`，包括 Root 调试、双击休眠、高采样率、充电控制等）
  - 睡眠模式、电池健康与热点 VPN 策略
- **桌面与多任务 (`packages/apps/Launcher3`)**
  - 桌面设置与 Quickspace 快捷信息（`infinity_strings.xml`）
  - 全屏手势教学沙盒模式与 Recent 多任务菜单（`quickstep/res`）
- **个性化扩展套件**
  - 主题商店（`ThemeStore`）
  - 样式中心（`OmniStyle`）
  - 快速预览（`AxQuickLook`）

---

## 🚀 使用方法

### 方法一：手动一键安装（推荐）

在 ROM 源码根目录下运行以下命令克隆并应用汉化：

```bash
# 1. 确保终端位于 Infinity ROM 源码根目录
cd /path/to/infinity-a17

# 2. 克隆本仓库到临时目录（锁定 17 分支）
git clone -b 17 [https://github.com/yokeshiq/infinity_chinese_translations.git](https://github.com/yokeshiq/infinity_chinese_translations.git) /tmp/infinity_zh

# 3. 执行一键安装脚本
bash /tmp/infinity_zh/install.sh
```

---

### 方法二：通过 Local Manifest 自动同步（构建自动化）

如果希望在执行 `repo sync` 时自动拉取汉化文件，可以在源码根目录下的 `.repo/local_manifests/chinese.xml` 中添加：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="yokeshiq/infinity_chinese_translations" 
           path="chinese_patch" 
           remote="github" 
           revision="17" />
</manifest>
```

在执行编译前追加单行软链接或拷贝命令：

```bash
bash chinese_patch/install.sh
```

---

## ⚠️ 注意事项

1. **上游代码同步**：  
   执行 `repo sync` 可能会保留未跟踪的修改，但在执行 `git reset --hard` 或清理工作区（`repo forall -c "git clean -fdx"`）后，已拷贝的中文资源会被清除。编译前重新执行一次 `install.sh` 即可。
2. **XML 语法校验**：  
   本仓库所有资源文件均经过 `xmllint` 合法性验证，确保不会因 XML 标签未闭合或实体转义问题导致 Soong / AAPT2 构建中断。

---

## 🤝 贡献与反馈

若在更新最新上游源码后发现新的未汉化条目，欢迎提交 Issue 或 Pull Request：

1. Fork 本仓库。
2. 在对应的 `res/values-zh-rCN/` 补齐字段。
3. 执行 `xmllint --noout <xml-path>` 确保语法正确无误。
4. 提交 PR。
